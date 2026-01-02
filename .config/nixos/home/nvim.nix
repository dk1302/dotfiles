{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      rust-analyzer
      rustc
      cargo
    ];
  };
}
