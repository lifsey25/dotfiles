#!usr/bin/env bash

# chmod u+x to make executable

backup() {
  mv ~/.bashrc ~/.bashrc.bak
  mv ~/.config/i3/config ~/.config/i3/config.bak
  mv ~/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf
}

add_custom_config() {
  cp .bashrc ~/.bashrc
  cp ./config/i3/config ~/.config/i3/config
  cp ./config/kitty/kitty.conf ~/.config/kitty/kitty.conf
}

echo "backing up old config files"
backup()
echo "copying new config files from dotfiles directory"
add_custom_config()
