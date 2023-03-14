#!/bin/bash

# some useful configs
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.desktop.session idle-delay 900
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 3600
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 3600

# add useful shortcuts
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super><Alt>Down']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']" 
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'Terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'gnome-terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Super>t'"

# configure package manager pacman
echo "[options]\nParallelDownloads = 5\nILoveCandy" | sudo tee -a /etc/pacman.conf 
sudo pacman-mirrors --fasttrack
sudo pacman -Syyu --noconfirm

# remove some packages
sudo pacman -R gnome-terminal gnome-tour yelp gnome-user-docs nano nano-syntax-highlighting vi --noconfirm

# install essential
sudo pacman -S alacritty base-devel git zellij nushell helix ttf-cascadia-code --noconfirm
git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg -si --noconfirm && sudo pacman -R go --noconfirm && cd
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
yay -Syyu oh-my-posh-bin --noconfirm
curl https://rtx.pub/install.sh | sh

# configure essential
echo "#\!/bin/sh\nalacritty \$(echo \$@ | sed 's/--/-e/g')" | sudo tee /bin/gnome-terminal && sudo chmod +x /bin/gnome-terminal
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# final configs
rm -rf .{bash*,z*,cache,dir_colors,lesshst,Xclients,xinitrc}
pacman -Qtdq | sudo pacman -Rs - --noconfirm
sudo pacman -Sc --noconfirm
