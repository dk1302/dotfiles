sudo apt install -y ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide tmux xclip 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#ppa's
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo add-apt-repository ppa:openrazer/stable -y
sudo add-apt-repository ppa:polychromatic/stable -y
sudo apt update -y
sudo apt install -y fastfetch neovim polychromatic
echo "fastfetch -l ~/.ascii" >> ~/.bashrc
echo "eval "$(zoxide init --cmd cd bash)"" >> ~/.bashrc
chmod +x alacritty.sh
./alacritty.sh
chmod +x yazi.sh
./yazi.sh
