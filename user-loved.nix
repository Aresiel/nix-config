{ config, pkgs, ... }:
let 
  secrets = import ./secrets.nix;
  colours = {
  	fg = "#ffffff";
  	bg = "#000000";
  };
in
{
  users.users.loved = {
    isNormalUser = true;
    home = "/home/loved";
    description = "Love Dittlau";
    shell = pkgs.zsh;
    extraGroups =
      [ "wheel" "networkmanager" "video" ]; # Enable ‘sudo’ for the user.
    hashedPassword =
      "$6$QuW9itZihkuLUj$x2AEi79V56v1Aj/rievYFeqcJwumHDE4yw8sROyOKaAGvRWGhPERyI.34UG8EFOi7gRAXYc1lRHMKXJ5m/PFk.";
  };
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.loved = { pkgs, ... }: {
    home.packages = [
      pkgs.cmatrix
      pkgs.firefox
      pkgs.authy
      pkgs.discord
      pkgs.lutris
      pkgs.nixfmt
    ];

	xsession.enable = true;
    xsession.windowManager.i3 = {
    	enable = true;
    	package = pkgs.i3-gaps;
    	config.bars = [];
    };
    
    programs.home-manager.enable = true;
    programs.rofi.enable = true;
    programs.git = {
    	enable = true;
    	package = pkgs.gitAndTools.gitFull;
    	userEmail = secrets.email;
    	userName = "Aresiel";
    };

    services.polybar = {
    	enable = true;
    	package = pkgs.polybarFull;
    	script = "polybar bottombar &\npolybar topbar &";
    	# settings = ... CONFIGURE LATER
    }; 
  };
}
