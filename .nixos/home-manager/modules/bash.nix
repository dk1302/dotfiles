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
        sh = "nix-shell";
        f = "fastfetch -l ~/starfield.jpg";
        d = "distrobox-tui";
      };
      initExtra = ''
        eval "$(zoxide init --cmd cd bash)"
        eval "$(fzf --bash)"
        fastfetch -l ~/starfield.jpg
        function r() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
          yazi "$@" --cwd-file="$tmp"
          IFS= read -r -d "" cwd < "$tmp"
          [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
          rm -f -- "$tmp"
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
    "$HOME/.scripts"
  ];
}
