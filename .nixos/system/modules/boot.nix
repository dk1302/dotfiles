{ config, lib, pkgs, ... }:
{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.timeout = 3;
    # initrd.kernelModules = [ "nvidia" ];
    #
    # plymouth = {
    #   enable = true;
    #   logo = "${pkgs.nixos-icons}/share/icons/hicolor/128x128/apps/nix-snowflake.png";
    # };

    # Enable "Silent boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "boot.shell_on_fail"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "rd.systemd.show_status=false"
    ];
  };
}
