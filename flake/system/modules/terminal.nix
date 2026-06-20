{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.terminess-ttf
  ];

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
    ripgrep
# python tools
    pyright
    black
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
  ];

  environment.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
    RUST_BACKTRACE = 1;
  };
}
