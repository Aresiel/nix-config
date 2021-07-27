{ config, pkgs, ... }:

{
  # Steam
  programs.steam.enable = true;
  programs.java.enable = true;
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override { extraPkgs = pkgs: [ pkgs.libgdiplus ]; };
  };
}
