{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/settings.nix
      ./modules/hyprland.nix
      ./modules/nvidia.nix
      ./modules/packages.nix
      ./modules/boot.nix
      ./musnix/default.nix
    ];

    musnix.enable = true;
    users.users.unknownd.extraGroups = [ "audio" ];

  system.stateVersion = "25.11"; # Did you read the comment?
}

