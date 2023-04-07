#!/bin/bash

# configure package manager pacman
echo "[options]\nParallelDownloads = 5\nILoveCandy" | sudo tee -a /etc/pacman.conf
sudo pacman-mirrors --fasttrack
sudo pacman -Syyu --noconfirm

# install packages to configs
sudo pacman -S yay --noconfirm
yay -S ttf-cascadia-code montserrat-ttf otf-san-francisco gtk-engine-murrine catppuccin-gtk-theme-macchiato --noconfirm

# some useful configs
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.desktop.session idle-delay 900
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 3600
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 3600
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:appmenu"

# configure style
gsettings set org.gnome.desktop.wm.preferences titlebar-font "SF Pro Display 11"
gsettings set org.gnome.desktop.interface font-name "SF Pro Display 12"
gsettings set org.gnome.desktop.interface document-font-name "Montserrat 12"
gsettings set org.gnome.desktop.interface monospace-font-name "Cascadia Code PL 12"
gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Ice"
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Macchiato-Standard-Sapphire-Dark"
gsettings set org.gnome.desktop.wm.preferences theme "Catppuccin-Macchiato-Standard-Sapphire-Dark"

# add useful shortcuts
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super><Alt>Down']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']" 
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'Terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'gnome-terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Super>t'"

# remove some packages
sudo pacman -R gnome-{terminal,tour,user-docs} manjaro-hello yelp nano nano-syntax-highlighting vi --noconfirm

# install essential
sudo pacman -S neofetch base-devel net-tools git alacritty zellij helix --noconfirm
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
yay -Syyu oh-my-posh-bin --noconfirm
curl https://rtx.pub/install.sh | sh

# configure essential
echo "#\!/bin/sh\nenv -u WAYLAND_DISPLAY alacritty \$(echo \$@ | sed 's/--/-e/g')" | sudo tee /bin/gnome-terminal && sudo chmod +x /bin/gnome-terminal
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git /tmp/zsh-syntax-highlighting && cd /tmp/zsh-syntax-highlighting/themes/ && cp catppuccin_macchiato-zsh-syntax-highlighting.zsh ~/.oh-my-zsh/custom && cd

# final configs
rm -rf .{bash*,z*,cache,dir_colors,lesshst,Xclients,xinitrc}
pacman -Qtdq | sudo pacman -Rs - --noconfirm
sudo pacman -Sc --noconfirm

# todos
echo "TODO: install gnome extensions: dash-to-dock, blur-my-shell"
echo "TODO: install firefox theme"
