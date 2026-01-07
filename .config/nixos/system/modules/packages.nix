{ config, lib, pkgs, ... }:
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
    alacritty
    blender
    fastfetch
    fd
    fzf
    gamescope
    git
    gtk3
    hypridle
    hyprpicker
    lazygit
    mako
    mgba
    nemo
    networkmanagerapplet
    osu-lazer-bin
    pamixer
    pavucontrol
    polychromatic
    poppler
    ripgrep
    rofi
    stow
    swww
    tmux
    tshark
    unzip
    uwsm
    waybar
    waypaper
    wl-clipboard
    wl-gammarelay-rs
    xhost
    yazi
    ytmdesktop
    zoxide
  ];
}
