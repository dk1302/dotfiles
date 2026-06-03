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

  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;

  environment.systemPackages = with pkgs; [
# terminal
    ghostty
    btop-cuda
    claude-code
    yazi
    lazygit
    starship
# misc tools
    git
    fzf
    imagemagick
    jq
    poppler
    zoxide
    unzip
    stow
    wev
# c/c++ tools
    clang-tools
# typst tools
    typst
    tinymist
    typstyle
# bash tools
    bash-language-server
    shfmt
# nix tools
    nixd
    nixfmt
# lua tools
    lua-language-server
    stylua
# rust tools
    rustc
    rust-analyzer
    cargo
    rustfmt
# csharp tools
    csharp-ls
    csharpier

## system
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
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    RUST_BACKTRACE = 1;
  };
}
