{ config, lib, pkgs, ... }:
{
  systemd.services.hyprland-suspend = {
    enable = true;
    unitConfig = {
      description = "Hyprland Suspend";
      before = [ "systemd-suspend.service" "systemd-hibernate.service" "nvidia-suspend.service" "nvidia-hibernate.service" ];
    };
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/usr/local/bin/suspend-hyprland.sh suspend";
    };
    wantedBy = [ "systemd-suspend.service" "systemd-hibernate.service" ];
  };

  systemd.services.hyprland-resume = {
    enable = true;
    unitConfig = {
      description = "Hyprland Resume";
      after = [ "systemd-suspend.service" "systemd-hibernate.service" "nvidia-resume.service" ];
    };
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/usr/local/bin/suspend-hyprland.sh resume";
    };
    wantedBy = [ "systemd-suspend.service" "systemd-hibernate.service" ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

}
