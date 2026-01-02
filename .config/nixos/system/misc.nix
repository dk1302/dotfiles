{ config, lib, pkgs, ... }:
{
  programs.bash.promptInit = ''PS1="  \[\e[38;5;33;1m\]<\[\e[38;5;51m\]\u\[\e[0m\]@\[\e[38;5;87m\]\H\[\e[38;5;33;1m\]> \[\e[0m\]| \[\e[38;5;33;1m\]<\[\e[0m\]\W\[\e[38;5;33;1m\]> \[\e[0;38;5;51m\]\\$\[\e[0m\]"'';

  fonts.packages = with pkgs; [
    nerd-fonts.recursive-mono
    nerd-fonts.gohufont
    nerd-fonts.departure-mono
  ];

  programs.firefox.enable = true;
  programs.steam.enable = true;

}
