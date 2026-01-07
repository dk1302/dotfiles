{ pkgs, ... }:
{
  programs.bash = {
  enable = true;
  shellAliases = {
    nrs = "sudo nixos-rebuild switch --flake .#unknownd";
    del = "nix-collect-garbage -d";
    sh = "nix-shell";
    f = "fastfetch -l ~/flake_ascii";
    g = "mgba-qt red.gba -p Odyssey.ups";
  };
  initExtra = ''
eval "$(zoxide init --cmd cd bash)"
eval "$(fzf --bash)"
fastfetch -l ~/flake_ascii
if uwsm check may-start && uwsm select; then
	exec uwsm start default
fi
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux 
fi
function r() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d "" cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}'';
  };
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.scripts"
  ];
}
