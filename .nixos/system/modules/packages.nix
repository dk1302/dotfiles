{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.bash.promptInit = ''PS1="  \[\e[38;5;214m\]<\[\e[38;5;160;1m\]\u\[\e[0m\]@\[\e[38;5;196m\]\H\[\e[38;5;214m\]> \[\e[0m\]| \[\e[38;5;214m\]<\[\e[0m\]\W\[\e[38;5;214m\]> \[\e[0;38;5;160m\]\\$\[\e[0m\]"'';

  fonts.packages = with pkgs; [
    nerd-fonts.recursive-mono
    nerd-fonts.gohufont
    nerd-fonts.iosevka

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
    grim
    hypridle
    hyprpicker
    hyprpaper
    imagemagick
    lazygit
    mako
    mgba
    nemo
    osu-lazer-bin
    quickshell
    pamixer
    pavucontrol
    polychromatic
    poppler
    ripgrep
    rofi
    slurp
    stow
    tshark
    ueberzugpp
    unzip
    uwsm
    waypaper
    wl-clipboard
    wl-gammarelay-rs
    xhost
    yazi
    ytmdesktop
    zoxide
  ];
}
