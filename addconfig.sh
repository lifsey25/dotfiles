#!/usr/bin/env bash
# TODO: setup symlinks

# chmod u+x to make executable

DOTFILES_DIR="$HOME/dotfiles"

# Check if dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Error: Dotfiles directory not found at $DOTFILES_DIR"
    exit 1
fi

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
  # Create directories if they don't exist
  mkdir -p ~/.config/i3
  mkdir -p ~/.config/i3status
  mkdir -p ~/.config/kitty

  # Copy files
  cp "$DOTFILES_DIR/.bashrc" ~/.bashrc
  cp "$DOTFILES_DIR/.config/i3/config" ~/.config/i3/config
  cp "$DOTFILES_DIR/.config/i3status/config" ~/.config/i3status/config
  cp "$DOTFILES_DIR/.config/kitty/kitty.conf" ~/.config/kitty/kitty.conf
}

echo "backing up old config files"
backup
echo "copying new config files from dotfiles directory"
add_custom_config
