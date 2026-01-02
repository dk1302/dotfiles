{ pkgs, ... }:
{
  home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";

  gtk = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };

    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };

    font = {name = "RecMono Nerd Font Mono"; package = pkgs.nerd-fonts.recursive-mono;};
  };
}
