with import <nixpkgs> { };

pkgs.mkShell {
  buildInputs = [
    # typescript tools
    typescript-language-server
    # qt tools
    qt6.qtbase
    qt6.qtdeclarative
    # c/cpp tools
    clang-tools
    # typst tools
    tinymist
    typstyle
    # bash tools
    bash-language-server
    shfmt
    # rust tools
    rustc
    rust-analyzer
    cargo
    rustfmt
    # nix tools
    nixd
    nixfmt
    #lua tools
    lua-language-server
    stylua
    # csharp tools
    csharp-ls
    csharpier
  ];

  # RUST_SRC_PATH = "${rust.packages.stable.rustPlatform.rustLibSrc}";
  # RUST_BACKTRACE = 1;
}
