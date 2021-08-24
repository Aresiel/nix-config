# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./xserver.nix
    ./networking.nix
    ./graphics.nix
    ./user-loved.nix
    ./zsh-shell.nix
    ./steam.nix
    ./sound.nix
    ./time.nix
    <home-manager/nixos>
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;

  # Set locale
  i18n.defaultLocale = "en_GB.UTF-8";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Declarative ftw
  users.mutableUsers = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    pkgs.micro
    pkgs.wget
    pkgs.kitty
    pkgs.xclip
    pkgs.gitFull
    pkgs.viu
    pkgs.nitrogen
    pkgs.pavucontrol
    pkgs.flameshot
    pkgs.devour
    pkgs.gnome.adwaita-icon-theme
    pkgs.qt4
    pkgs.bluez
    pkgs.bluez-tools
    (pkgs.steam.override { withJava = true; })
  ];

  programs.java = {
  	enable = true;
  	package = pkgs.jdk;
  };

  # Bluetooth Control
  services.blueman.enable = true;

  # Backlight control
  programs.light.enable = true;

  fonts.fonts = with pkgs;
    [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];

  system.stateVersion = "21.05"; # Did you read the comment?

  # Automatic Upgrades
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  nixpkgs.config.allowUnfree = true;

  # Power savings
  services.tlp.enable = true;
  powerManagement.powertop.enable = true;
  powerManagement.enable = true;

}
