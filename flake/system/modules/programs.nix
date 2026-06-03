{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  programs.gpu-screen-recorder.enable = true;

  programs.mango.enable = true;

  programs.dconf.enable = true;

  programs.firefox.enable = true;

  programs.steam.enable = true;

  programs.nix-ld.enable = true;
}
