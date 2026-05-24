{
  config,
  lib,
  pkgs,
  ...
}:
{
  fonts.packages = with pkgs; [
    nerd-fonts.recursive-mono
    nerd-fonts.terminess-ttf
  ];

  programs.gpu-screen-recorder.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  programs.firefox.enable = true;

  programs.steam.enable = true;

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    blender
    btop
    claude-code
    fastfetch
    fzf
    gamemode
    gdb
    godot
    git
    gtk3
    ghostty
    hyprpicker
    hyprpaper
    imagemagick
    lazygit
    mako
    mgba
    nemo
    osu-lazer-bin
    quickshell
    polychromatic
    poppler
    qtcreator
    rofi
    starship
    stow
    typst
    unzip
    uwsm
    video-trimmer
    waypaper
    wl-clipboard
    wl-gammarelay-rs
    xhost
    yazi
    ytmdesktop
    zoxide
  ];
}
