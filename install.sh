git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
git config --global user.email "deank293@gmail.com"
git config --global user.name "dk1302"
# Install binaries
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
curl -L https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --channel 9.0
# Path Setup
echo "alias t='tmux'" >> ~/.bashrc
echo "alias e='nvim'" >> ~/.bashrc
echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.bashrc
echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools:$HOME/.local/bin:$HOME/.scripts' >> ~/.bashrc
echo "fastfetch -l ~/.ascii" >> ~/.bashrc
echo 'eval "$(zoxide init --cmd c bash)"' >> ~/.bashrc
echo 'eval "$(fzf --bash)"' >> ~/.bashrc
echo 'if uwsm check may-start && uwsm select; then
	exec uwsm start default
fi
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux 
fi' >> ~/.bashrc
