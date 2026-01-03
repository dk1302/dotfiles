{ pkgs, ... }: {
  imports = [
    ./modules/bash.nix
    ./modules/gtk.nix
    ./modules/yazi.nix
  ];

  home.username = "unknownd";
  home.homeDirectory = "/home/unknownd";
  home.stateVersion = "26.05";
}
