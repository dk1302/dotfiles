{ config, lib, pkgs, ... }:
{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };

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

  # services.pulseaudio = {
  #   enable = true;
  #   package = pkgs.pulseaudioFull;
  #   extraConfig = "load-module module-switch-on-connect";
  # };

  # rtkit (optional, recommended) allows Pipewire to use the realtime scheduler for increased performance.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment the following
    #jack.enable = true;
  };

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 48;
      "default.clock.min-quantum" = 48;
      "default.clock.max-quantum" = 48;
    };
  };

  services.pipewire.extraConfig.pipewire-pulse."92-low-latency" = {
    "context.properties" = [
      {
        name = "libpipewire-module-protocol-pulse";
        args = { };
      }
    ];
    "pulse.properties" = {
      "pulse.min.req" = "48/48000";
      "pulse.default.req" = "48/48000";
      "pulse.max.req" = "48/48000";
      "pulse.min.quantum" = "48/48000";
      "pulse.max.quantum" = "48/48000";
    };
    "stream.properties" = {
      "node.latency" = "48/48000";
      "resample.quality" = 1;
    };
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
