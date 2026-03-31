{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.bash.promptInit = ''PS1="  \[\e[38;5;33;1m\]<\[\e[38;5;51m\]\u\[\e[0m\]@\[\e[38;5;87m\]\H\[\e[38;5;33;1m\]> \[\e[0m\]| \[\e[38;5;33;1m\]<\[\e[0m\]\W\[\e[38;5;33;1m\]> \[\e[0;38;5;51m\]\\$\[\e[0m\]"'';

  fonts.packages = with pkgs; [
    nerd-fonts.recursive-mono
    nerd-fonts.gohufont
  ];

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      droidcam-obs
    ];
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  programs.firefox.enable = true;

  programs.steam.enable = true;

  programs.nix-ld.enable = true;

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
    };
  };

  users.users.unknownd.extraGroups = [ "podman" ];

  environment.systemPackages = with pkgs; [
    alacritty
    blender
    btop
    distrobox
    distrobox-tui
    fastfetch
    fd
    fzf
    gamescope
    gamemode
    godot
    git
    gtk3
    hypridle
    hyprpicker
    lazygit
    mako
    mgba
    nemo
    networkmanagerapplet
    osu-lazer-bin
    pamixer
    pavucontrol
    polychromatic
    poppler
    ripgrep
    rofi
    stow
    swww
    tshark
    ueberzugpp
    unzip
    uwsm
    waybar
    waypaper
    wl-clipboard
    wl-gammarelay-rs
    xhost
    yazi
    ytmdesktop
    zoxide
  ];
}
