{ pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        padding = {
          left = 1;
          top = 1 ;
        };
        color = {
          "1" = "#fc8eac";
        };
      };
      modules = [
        "break"
        "title"
        "separator"
        "os"
        "host"
        "uptime"
        "theme"
        "gpu"
        "memory"
        "disk"
        "break"
        "colors"
      ];
    };
  };
}
