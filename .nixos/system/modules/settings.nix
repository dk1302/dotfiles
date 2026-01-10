{ config, lib, pkgs, ... }:
{
  hardware.openrazer = {
    enable = true;
    users = ["unknownd"];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "dev"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
   };

  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };

  services.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraConfig = "load-module module-switch-on-connect";
  };

  services.pipewire = {
    enable = false;
    pulse.enable = false;
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  services.getty.autologinUser = "unknownd";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.unknownd = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  services.openssh.enable = true;
}
