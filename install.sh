#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

#update 
pacman -Syu

#install paru
sudo pacman -S --needed base-devel sddm
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

#install dependecies
paru -S bspwm polybar sxhkd dunst rofi lsd checkupdates-aur \
playerctl mpd ncmpcpp mpc picom-arian8j2-git xtitle termite betterlockscreen \
nerd-fonts-jetbrains-mono ttf-jetbrains-mono papirus-icon-theme ttf-inconsolata feh

#install dotfiles
cd ~
git clone https://github.com/gh0stzk/dotfiles.git
cd dotfiles
mkdir ~/.config
mkdir ~/.local
chown $(whoami): ~/.local
chown $(whoami): ~/.config
mv ./.config/* ~/.config
mv ./.local/* ~/.local
mv .zshrc ~/

# Enabling Services and Graphical User Interface
systemctl enable sddm
systemctl set-default graphical.target
