#!/bin/bash

# --> install packages
# 1. install aur helper(yay)
cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd
# 2. update yay packages
yay -Syyu
# 3. install terminal emulator(alacritty)
pacman -Sy alacritty
# 4. install font(cascadia code)
pacman -Sy ttf-cascadia-code
# 5. install asdf
yay -Sy asdf-vm
# 6. install personal default languages 1
for i in "python" "julia" "nodejs" "deno" "ruby" "rust"; do
  asdf plugin add $i
  asdf install $i latest
  asdf global $i latest
done
# 7. fix rust installation 
rustup default stable
# 8. install personal default languages 2
yay -Sy cbqn-git gnu-apl
# 9. install personal default databases
pacman -Sy sqlite mysql postgresql
# 10. install rust alternatives
cargo install bat exa tokei hyperfine ytop
# 11. install neovim
pacman -Sy neovim
# 12. install lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
# 13. install vscode
yay -Sy visual-studio-code-bin
