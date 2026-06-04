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
    ./modules/services.nix
    ./modules/nvidia.nix
    ./modules/desktop.nix
    ./modules/terminal.nix
  ];

  system.stateVersion = "25.11"; # Did you read the comment?
}
