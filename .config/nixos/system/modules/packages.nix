{ inputs, config, lib, pkgs, ... }:
{
  programs.bash.promptInit = ''PS1="  \[\e[38;5;33;1m\]<\[\e[38;5;51m\]\u\[\e[0m\]@\[\e[38;5;87m\]\H\[\e[38;5;33;1m\]> \[\e[0m\]| \[\e[38;5;33;1m\]<\[\e[0m\]\W\[\e[38;5;33;1m\]> \[\e[0;38;5;51m\]\\$\[\e[0m\]"'';

  fonts.packages = with pkgs; [
    nerd-fonts.recursive-mono
    nerd-fonts.gohufont
  ];

  programs.firefox.enable = true;
  
  programs.steam.enable = true;

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    nano
    gamescope
    lazygit
    swww
    blender
    wireshark
    stow
    rofi
    nemo
    fastfetch
    unzip
    swaynotificationcenter
    waybar
    waypaper
    hypridle
    hyprpicker
    gtk3
    yazi
    tmux
    wl-clipboard
    poppler
    fd
    ripgrep
    fzf
    zoxide
    alacritty
    wl-gammarelay-rs
    git
    ytmdesktop
    uwsm
    networkmanagerapplet
    blueman
    xhost
  ];
}
