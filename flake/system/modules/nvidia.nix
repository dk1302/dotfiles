{
  config,
  lib,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  # Enable OpenGL
  hardware = {
    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;

      powerManagement.enable = true;

      powerManagement.finegrained = false;

      open = false;

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.nvidia.acceptLicense = true;

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
