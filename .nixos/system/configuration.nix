{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/settings.nix
    ./modules/nvidia.nix
    ./modules/packages.nix
    ./modules/boot.nix
    ./modules/lgc.nix
    ./modules/lmc.nix
  ];

  system.stateVersion = "25.11"; # Did you read the comment?
}
