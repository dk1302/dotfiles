{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.services.gpuMemClock = {
    unitConfig = {
      after = ["graphical.target"];
      description = "Raise min gpu memory clock speed.";
    };

    serviceConfig = {
      ExecStart = "/run/current-system/sw/bin/nvidia-smi -lmc 5001,10501";
      Type = "oneshot";
    };

    wantedBy = ["graphical.target"];
  };


}
