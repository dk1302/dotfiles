!#/bin/bash
sudo apt install -y ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide tmux xclip 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#ppa's
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo add-apt-repository -y ppa:openrazer/stable
sudo add-apt-repository -y ppa:polychromatic/stable
sudo apt update -y
sudo apt install -y fastfetch neovim polychromatic
echo "fastfetch -l ~/.ascii" >> ~/.bashrc
echo "eval "$(zoxide init --cmd cd bash)"" >> ~/.bashrc
