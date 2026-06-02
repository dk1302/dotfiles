{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  fonts.packages = with pkgs; [
    nerd-fonts.recursive-mono
    nerd-fonts.terminess-ttf
  ];

  programs.gpu-screen-recorder.enable = true;

  programs.mango.enable = true;

  programs.dconf.enable = true;

  programs.firefox.enable = true;

  programs.steam.enable = true;

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    awww
    blender
    btop-cuda
    claude-code
    droidcam
    fzf
    gamemode
    gammastep
    git
    gtk3
    ghostty
    hypridle
    hyprpicker
    imagemagick
    jq
    lazygit
    mako
    nemo
    osu-lazer-bin
    quickshell
    polychromatic
    poppler
    rofi
    skyemu
    starship
    stow
    teams-for-linux
    typst
    unzip
    uwsm
    video-trimmer
    waypaper
    wev
    wl-clipboard
    yazi
    ytmdesktop
    zoxide
  ];
}
