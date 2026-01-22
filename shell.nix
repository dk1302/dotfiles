with import <nixpkgs> { };
let
  libPath =
    with pkgs;
    lib.makeLibraryPath [
      libxkbcommon
      wayland
    ];
in
{
  devShell =
    with pkgs;
    mkShell {
      buildInputs = [
        vulkan-tools
        vulkan-loader
        vulkan-headers
        vulkan-validation-layers
        # typst tools
        typst
        tinymist
        typstyle
        # bash tools
        bash-language-server
        shfmt
        # c/cpp tools
        clang-tools
        gdb
        glfw
        glm
        perf
        # glsl tools
        glsl_analyzer
        glslviewer
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
        # python tools
        python315
        pyright
      ];

      LD_LIBRARY_PATH = libPath;

      RUST_SRC_PATH = "${rust.packages.stable.rustPlatform.rustLibSrc}";
      RUST_BACKTRACE = 1;
    };
}
