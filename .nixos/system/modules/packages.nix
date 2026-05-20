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
    fastfetch
    fd
    fzf
    gamemode
    gdb
    godot
    git
    gtk3
    grim
    ghostty
    hyprpicker
    hyprpaper
    imagemagick
    mako
    mgba
    nemo
    osu-lazer-bin
    quickshell
    pavucontrol
    polychromatic
    poppler
    qtcreator
    ripgrep
    rofi
    slurp
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
