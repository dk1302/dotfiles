{ pkgs, ... }:
{
  home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    # theme = {
    #   name = "gruvbox-dark";
    #   package = pkgs.gruvbox-dark-gtk;
    # };

    theme = {
      name = "amarena";
      package = pkgs.amarena-theme;
    };

    font = {
      name = "RecMono Linear Nerd Font Mono";
      package = pkgs.nerd-fonts.recursive-mono;
    };

    colorScheme = "dark";

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  qt = {
    enable = true;
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };
}
