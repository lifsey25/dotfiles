#!/usr/bin/env bash

# chmod u+x to make executable

DOTFILES_DIR="~/dotfiles" # must clone in user's home directory or edit variable

install_yay() {
  if ! command -v yay &> /dev/null; then
    echo "yay is not installed. installing..."
    sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    echo "installation complete"
  else
    echo "yay is already installed"
  fi
}

backup() {
  mv ~/.bashrc ~/.bashrc.bak

  if [ -f ~/.config/i3/config ]; then
    mv ~/.config/i3/config ~/.config/i3/config.bak
  fi

  if [ -f ~/.config/i3status/config ]; then
    mv ~/.config/i3status/config ~/.config/i3status/config.bak
  fi

  if [ -f ~/.config/kitty/kitty.conf ]; then
    mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf.bak
  fi
}

add_custom_config() {
  cp "$DOTFILES_DIR"/.bashrc ~/.bashrc
  cp "$DOTFILES_DIR"/.config/i3/config ~/.config/i3/config
  cp "$DOTFILES_DIR"/.config/i3status/config ~/.config/i3status/config
  cp "$DOTFILES_DIR"/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf
}

echo "backing up old config files"
backup
echo "copying new config files from dotfiles directory"
add_custom_config
