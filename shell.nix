with import <nixpkgs> { };

pkgs.mkShell {
  name = "system";
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
}
