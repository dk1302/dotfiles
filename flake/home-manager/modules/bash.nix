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
        nrs = "cd ~/flake && sudo nixos-rebuild switch --flake .#unknownd";
        sdel = "sudo nix-collect-garbage -d";
        del = "nix-collect-garbage -d";
        m = "macchina";
        qwen = "ollama run qwen2.5-coder:7b";
      };
      initExtra = ''
        PATH=$PATH:~/scripts
        export STARSHIP_CONFIG=~/.config/starship/starship.toml
        eval "$(starship init bash)"
        eval "$(zoxide init --cmd cd bash)"
        eval "$(fzf --bash)"
        macchina
        function r() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
          command yazi "$@" --cwd-file="$tmp"
          IFS= read -r -d \'\' cwd < "$tmp"
          [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
          command rm -f -- "$tmp"
        }
      '';
    };
  };
}
