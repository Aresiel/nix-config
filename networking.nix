{ config, pkgs, ... }:

{
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp3s0.useDHCP = true; # hardware dependant
  networking.interfaces.wlp0s20f3.useDHCP = true; # hardware dependant
  networking.networkmanager.enable = true;
  networking.hostName = "love-nixos";
}
