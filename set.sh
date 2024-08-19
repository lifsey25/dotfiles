#!/usr/bin/env bash

install_yay() {
  if ! command -v yay &> /dev/null; then
    echo "yay is not installed. installing..."
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    echo "installation complete"
  else 
    echo "yay is already installed"
  fi
}

install_starship() {
  curl -sS https://starship.rs/install.sh | sh
}

