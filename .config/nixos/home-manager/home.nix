{ pkgs, ... }: {
  home.username = "unknownd";
  home.homeDirectory = "/home/unknownd";
  home.stateVersion = "26.05";

  import = [
    ./modules/bash.nix
    ./modules/gtk.nix
    ./modules/nvim.nix
    ./modules/yazi.nix
  ];
}
