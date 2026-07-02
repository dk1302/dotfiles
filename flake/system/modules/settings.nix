{ config, pkgs, ... }:
{
  boot.loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
      timeout = 0;
  };

  boot.kernelModules = [ "v4l2loopback" ];

  boot.extraModulePackages = with config.boot.kernelPackages;
    [ v4l2loopback.out ];

  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';

  services.getty.autologinUser = "unknownd";

  environment.loginShellInit = ''
    [ "$(tty)" = /dev/tty1 ] && exec mango
    '';

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.unknownd = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
      tree
      ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "dev"; # Define your hostname.

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  services.openssh.enable = true;
}
