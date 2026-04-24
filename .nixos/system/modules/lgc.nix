{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.services.gpuClock = {
    unitConfig = {
      after = [ "graphical.target" ];
      description = "Raise min gpu clock speed.";
    };

    serviceConfig = {
      ExecStart = "/run/current-system/sw/bin/nvidia-smi -lgc 510,3105";
      Type = "oneshot";
    };

    wantedBy = [ "graphical.target" ];
  };

}
