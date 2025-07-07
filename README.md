### Arch Hyprland dotfiles
## Prerequisites
Fresh install of Arch with minimal desktop and systemd boot is recommended. If you are using an nvidia gpu, make sure to set up nvidia drivers as per the hyprland wiki https://wiki.hypr.land/Nvidia/. 

## Installation
Make sure git and stow are installed with pacman.
```
sudo pacman -S git stow
```
Clone the repository, link the config files and cache the fonts.
```
git clone https://github.com/dk1302/dotfiles.git
cd dotfiles
stow .
fc-cache
```
Run the install scripts in the following order, making sure to reboot in between each script.
```
./base.sh
systemctl reboot
./install.sh
systemctl reboot
./post.sh
systemctl reboot
```
## Warnings
# Bugs
Minor bug where waybar duplicates after resuming from suspend. Reset wallpaper with `wallmenu` to fix.
