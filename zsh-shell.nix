{ config, pkgs, ... }:

{
  # ZSH + Oh My Zsh!
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "python" "man" ];
    theme = "agnoster";
  };
}
