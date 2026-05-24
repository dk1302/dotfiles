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
        nrs = "cd ~/update && sudo nixos-rebuild switch --flake .#unknownd";
        sdel = "sudo nix-collect-garbage -d";
        del = "nix-collect-garbage -d";
        f = "fastfetch";
        qwen = "ollama run qwen2.5-coder:7b";
      };
      initExtra = ''
        export STARSHIP_CONFIG=~/.config/starship/starship.toml
        eval "$(starship init bash)"
        eval "$(zoxide init --cmd cd bash)"
        eval "$(fzf --bash)"
        fastfetch
        function r() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
          command yazi "$@" --cwd-file="$tmp"
          IFS= read -r -d \'\' cwd < "$tmp"
          [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
          command rm -f -- "$tmp"
        }
      '';
      profileExtra = ''
        if uwsm check may-start && uwsm select; then
          exec uwsm start default
        fi
      '';
    };
  };
  home.sessionPath = [
    "$HOME/scripts"
  ];
}
