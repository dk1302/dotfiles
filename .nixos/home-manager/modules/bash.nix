{ pkgs, ... }:
{
  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    bash = {
      enable = true;
      shellAliases = {
        nrs = "cd nix && sudo nixos-rebuild switch --flake .#unknownd";
        del = "sudo nix-collect-garbage -d";
        f = "fastfetch -l ~/starfield_new.jpg";
      };
      initExtra = ''
        export STARSHIP_CONFIG=~/.config/starship/starship.toml
        eval "$(starship init bash)"
        eval "$(zoxide init --cmd cd bash)"
        eval "$(fzf --bash)"
        fastfetch -l ~/starfield_new.jpg
      '';
      profileExtra = ''
        if uwsm check may-start && uwsm select; then
          exec uwsm start default
        fi
      '';
    };
  };
  home.sessionPath = [
    "$HOME/.scripts"
  ];
}
