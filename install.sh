!#/bin/bash
sudo apt install xclip cmake libevent ncurses libevent-dev ncurses-dev build-essential bison pkg-config ffmpeg 7zip jq poppler-utils ripgrep libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev stow
#imagemagick
git clone --depth 1 --branch [latest_release_tag] https://github.com/ImageMagick/ImageMagick.git ImageMagick-7.1.1
cd ImageMagick-7.1.1
./configure
make
./configure --with-modules
sudo make install
sudo ldconfig /usr/local/lib
cd ~
rm -rf ImageMagick-7.1.1
#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
cd ~
#zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo "eval "$(zoxide init --cmd cd bash)"" >> ~/.bashrc
cd ~
#tmux
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make && sudo make install
cd ~
rm -rf tmux
#rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
#fd
git clone https://github.com/sharkdp/fd
cd fd
cargo build
cargo test
cargo install --path .
cd ~
rm -rf fd
#yazi
git clone https://github.com/sxyazi/yazi.git
cd yazi
cargo build --release --locked
mv target/release/yazi target/release/ya /usr/local/bin/
cd ~
rm -rf yazi
#docker
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty
rustup override set stable
rustup update stable
cargo build --release
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
echo "source ~/.bash_completion/alacritty" >> ~/.bashrc
cd ~
rm -rf alacritty
#ppa's
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:openrazer/stable
sudo add-apt-repository ppa:polychromatic/stable
sudo apt update
sudo apt install fastfetch neovim polychromatic
#dotfiles
git clone https://github.com/dk1302/dotfiles.git
cd dotfiles
stow .


