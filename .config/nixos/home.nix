{ pkgs, ...}: {
  home.username = "unknownd";
  home.homeDirectory = "/home/unknownd";
  home.stateVersion = "25.11";

  imports = 
    [
      ./home/bash.nix
      ./home/gtk.nix
      ./home/nvim.nix
      ./home/yazi.nix
    ];
}
