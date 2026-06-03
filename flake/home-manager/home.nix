{ pkgs, ... }:
{
  imports = [
    ./modules/bash.nix
    ./modules/style.nix
    ./modules/nvim.nix
  ];

  home.username = "unknownd";
  home.homeDirectory = "/home/unknownd";
  home.stateVersion = "26.05";
}
