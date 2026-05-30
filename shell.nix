with import <nixpkgs> { };

pkgs.mkShell {
  name = "system";
  buildInputs = [
    # c/c++ tools
    clang-tools
    # typst tools
    tinymist
    typstyle
    # bash tools
    bash-language-server
    shfmt
    # nix tools
    nixd
    nixfmt
    #lua tools
    lua-language-server
    stylua
    # rust tools
    rustc
    rust-analyzer
    cargo
    rustfmt
    #csharp tools
    csharp-ls
    csharpier
  ];

  RUST_SRC_PATH = "${rust.packages.stable.rustPlatform.rustLibSrc}";
  RUST_BACKTRACE = 1;
}
