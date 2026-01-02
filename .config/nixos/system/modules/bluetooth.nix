{ config, lib, pkgs, ... }:
{
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
   };
  # services.pulseaudio = {
  #   enable = true;
  #   package = pkgs.pulseaudioFull;
  # };
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
}
