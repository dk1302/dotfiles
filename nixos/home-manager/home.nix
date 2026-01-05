{ pkgs, ... }: {
  imports = [
    ./modules/bash.nix
    ./modules/style.nix
    ./modules/yazi.nix
    ./modules/nvim.nix
    ./modules/fastfetch.nix
  ];

  home.username = "unknownd";
  home.homeDirectory = "/home/unknownd";
  home.stateVersion = "26.05";
}
