{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.lightdm = { # lightdm
      enable = true;
      greeters.mini = {
        enable = true;
        user = "loved";
        extraConfig = ''
          [greeter]
          show-password-label = false
          password-input-width = 20
          invalid-password-text = Invalid
          [greeter-theme]
          background-image = ""
          background-color = "#000000"
          window-color = "#000000"
          border-color = "#000000"
          password-background-color = "#000000"
          password-color = "#ffffff"
          text-color = "#ffffff"
          error-color = "#ff0000"
          password-border-color = "#000000"
          password-character = *
          font-size = 30
          font = JetBrainsMono Nerd Font Mono:style=Regular
        '';
      };
    };
    layout = "se";
    libinput.enable = true; # touchpad support
    videoDrivers = [ "nvidia" ];
    useGlamor = true;
  };
}
