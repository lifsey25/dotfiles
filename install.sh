#!/usr/bin/env bash

# checks for and installs yay
install_yay() {
  if ! command -v yay &> /dev/null; then
    echo "yay is not installed. installing..."
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    echo "installation complete"
  else 
    echo "yay is already installed"
  fi
}

# installs starship
install_starship() {
  curl -sS https://starship.rs/install.sh | sh
}

# installs i3, rofi, and dependencies
install_i3() {
  yay -S xorg xorg-xinit i3-wm i3lock i3status i3blocks xterm lightdm-gtk-greeter lightdm rofi
}

install_misc() {
  yay -S btop firefox librewolf-bin ripgrep neovim eza
}
