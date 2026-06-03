{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "oomox-gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
    };

    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };

    font = {
      name = "RecMono Linear Nerd Font Mono";
      package = pkgs.nerd-fonts.recursive-mono;
    };
  };

  qt = {
    enable = true;
    style.name = "gtk2";
    style.package = pkgs.libsForQt5.qtstyleplugins;
  };
}
