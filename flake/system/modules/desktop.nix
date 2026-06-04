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
  ];

  programs.gpu-screen-recorder.enable = true;

  programs.mango.enable = true;

  programs.dconf.enable = true;

  programs.firefox.enable = true;

  programs.steam.enable = true;

  programs.nix-ld.enable = true;

  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;

  environment.systemPackages = with pkgs; [
# applications
    blender
    droidcam
    mgba
    nemo
    video-trimmer
    ytmdesktop
# interface
    quickshell
    rofi
# wallpaper
    awww
    waypaper
# screenshot
    grim
    slurp
# background
    gammastep
    gtk3
    hypridle
    mako
    wl-clipboard
# gaming
    gamemode
    osu-lazer-bin
    polychromatic
  ];

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk2";
  };
}
