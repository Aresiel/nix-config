{ config, pkgs, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in {
  environment.systemPackages = [ nvidia-offload ];

  # Configure NVIDIA
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  hardware.nvidia = {
    prime = {
      offload.enable = true;
      intelBusId = "PCI:0:2:0"; # hardware dependant
      nvidiaBusId = "PCI:2:0:0"; # hardware dependant
    };
    modesetting.enable = true;
    powerManagement.finegrained = true;
    nvidiaPersistenced = true;
  };

  # OpenGL 
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
