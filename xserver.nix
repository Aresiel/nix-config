{ config, pkgs, ... }:
let
  colours = import ./colours.nix;
in
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
          invalid-password-text = Invalid
          [greeter-theme]
          background-image = "/etc/lightdm/wallpaper.png"
          password-character = *
          font = JetBrainsMono Nerd Font Mono:style=Regular
          window-color = "${colours.bg}"
          border-color = "${colours.fg}"
          text-color = "${colours.fg}"
          password-background-color = "${colours.bg}"
          password-border-color = "${colours.fg}"
        '';
      };
    };
    windowManager = {
    	i3 = {
    		enable = true;
    		package = pkgs.i3-gaps; # Make sure matching userconfig
    	};
    };
    layout = "se";
    libinput.enable = true; # touchpad support
    videoDrivers = [ "nvidia" ];
    useGlamor = true;
  };
}
