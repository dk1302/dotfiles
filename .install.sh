sudo apt-get install -y cmake build-essential pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 \
                    ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide tmux xclip
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
#ppa's
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo add-apt-repository ppa:openrazer/stable -y
sudo add-apt-repository ppa:polychromatic/stable -y
sudo apt update -y
sudo apt install -y fastfetch neovim polychromatic
echo "fastfetch -l ~/.ascii" >> ~/.bashrc
echo "eval "$(zoxide init --cmd cd bash)"" >> ~/.bashrc
echo "alias j='gsettings set org.cinnamon.desktop.background picture-uri 'file:///home/unknownd/Pictures/day.jpg''" >> ~/.bashrc
echo "alias k='gsettings set org.cinnamon.desktop.background picture-uri 'file:///home/unknownd/Pictures/night.jpg''" >> ~/.bashrc
git config --global user.email "deank293@gmail.com"
git config --global user.name "dk1302"
curl -L https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --channel 9.0
echoe "export DOTNET_ROOT=$HOME/.dotnet" >> ~/.bashrc
echo "export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools" >> ~/.bashrc
