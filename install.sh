#!/bin/bash

#shit i need
sudo pacman -Syu
sudo pacman -S firefox lxappearance dolphin qt5ct ntfs-3g gnome-disk-utility spectacle sddm ranger ueberzug xorg-xsetroot ark polkit-gnome
#theme
cd /usr/share/themes/
sudo git clone https://github.com/EliverLara/Nordic.git
#install dependecies
paru -S bspwm polybar sxhkd dunst rofi lsd bsp-layout pacman-contrib protonvpn-cli checkupdates-aur \
playerctl mpd ncmpcpp mpc picom-arian8j2-git xtitle termite betterlockscreen \
nerd-fonts-jetbrains-mono ttf-jetbrains-mono papirus-icon-theme ttf-inconsolata powerline-fonts ttf-roboto feh

#install dotfiles
mkdir ~/.config
mkdir ~/.local
chown $(whoami): ~/.local
chown $(whoami): ~/.config
chown $(whoami): ~/
mv ./.config/* ~/.config
mv ./.local/* ~/.local
mv .zshrc ~/
chmod +x ~/.config/bspwm/scripts/thememenu.sh
chmod +x ~/.config/bspwm/scripts/updates.sh
chmod +x ~/.config/bspwm/scripts/weather-mini.sh
chmod +x ~/.config/bspwm/bin/*
chmod +x ~/.local/bin/colorscript
chmod +x ~/.local/bin/screenshoter
chmod +x ~/.local/bin/sysfetch
chmod +x ~/.local/bin/zfetch

# Enabling Services and Graphical User Interface
systemctl enable sddm
systemctl set-default graphical.target
