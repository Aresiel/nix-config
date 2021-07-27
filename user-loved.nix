{ config, pkgs, ... }:

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
    programs.home-manager.enable = true;
    programs.rofi.enable = true;
  };
}
