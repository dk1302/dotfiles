{ pkgs, ... }:
{
  home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";

  gtk = {
    enable = true;
    gtk2.enable = false;
    gtk4.enable = false;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    theme = {
      name = "amarena";
      package = pkgs.amarena-theme;
    };

    font = {name = "RecMono Nerd Font Mono"; package = pkgs.nerd-fonts.recursive-mono;};

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=true;
    };
  };

  qt = {
    enable = true;
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };
}
