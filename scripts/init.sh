#!/bin/bash

# configure package manager
echo "[options]\nParallelDownloads = 5\nILoveCandy" | sudo tee -a /etc/pacman.conf
sudo pacman-mirrors --fasttrack
sudo pacman -Syyu --noconfirm

# install packages to configs
sudo pacman -S yay --noconfirm
yay -S ttf-cascadia-code otf-san-francisco montserrat-ttf noto-fonts-emoji ttf-bqn386-git \ # fonts
  gtk-engine-murrine gnome-themes-extra catppuccin-gtk-theme-mocha \ # theme
  --noconfirm
  
wget -P /tmp https://github.com/catppuccin/gtk/releases/download/v0.6.0/Catppuccin-Mocha-Standard-Lavender-Dark.zip
unzip /tmp/Catppuccin-Mocha-Standard-Lavender-Dark.zip -d /tmp/catppucin
mv /tmp/catppuccin/Catppuccin-Mocha-Standard-Lavender-Dark/gtk-4.0/gtk*.css /tmp/catppuccin/Catppuccin-Mocha-Standard-Lavender-Dark/gtk-4.0/assets/ ~/.config/gtk-4.0
  
# some useful configs
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.desktop.session idle-delay 900
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 3600
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 3600
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:appmenu"

# configure styles
gsettings set org.gnome.desktop.wm.preferences titlebar-font "SF Pro Display 11"
gsettings set org.gnome.desktop.interface font-name "SF Pro Display 12"
gsettings set org.gnome.desktop.interface document-font-name "Montserrat 12"
gsettings set org.gnome.desktop.interface monospace-font-name "Cascadia Code PL 12"
gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Ice"
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Standard-Lavander-Dark"
gsettings set org.gnome.desktop.wm.preferences theme "Catppuccin-Mocha-Standard-Lavander-Dark"

# add useful shortcuts
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super><Alt>Down']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']" 
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'Terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'gnome-terminal'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Super>t'"

# remove some packages
yay -R gnome-{terminal,tour,user-docs} manjaro-hello yelp gedit \ # gnome
  kvantum kvantum-manjaro \ # qt6
  vi nano nano-syntax-highlighting \ # unused
  --noconfirm

# install essential  
yay -S neofetch base-devel net-tools git github-cli \ # basic tools
  alacritty tmux helix neovim visual-studio-code-bin oh-my-posh-bin \ # dev tools
  discord obsidian kooha appimagelauncher gimp \ # other tools
  --noconfirm
 
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl https://rtx.pub/install.sh | sh
echo -e "\\neval \"\$(/home/dreisss/.local/share/rtx/bin/rtx activate -s zsh)\"" >> ~/.zshrc

# configure essential
echo "#\!/bin/sh\nenv -u WAYLAND_DISPLAY alacritty \$(echo \$@ | sed 's/--/-e/g')" | sudo tee /bin/gnome-terminal && sudo chmod +x /bin/gnome-terminal  
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git /tmp/zsh-syntax-highlighting && cd /tmp/zsh-syntax-highlighting/themes/ && cp catppuccin_macchiato-zsh-syntax-highlighting.zsh ~/.oh-my-zsh/custom && cd

# final configs
rm -rf .{bash*,z*,cache,dir_colors,lesshst,Xclients,xinitrc}
yay -Qtdq | yay -Rs - --noconfirm
yay -Sc --noconfirm
