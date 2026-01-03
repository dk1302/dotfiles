{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      csharp-ls
      csharpier
      typescript-language-server
      lua-language-server
      pyright
      rust-analyzer
      rustc
      cargo
    ];
  };
}
