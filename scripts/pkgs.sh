#!/bin/bash

# install default languages/tools
for plugin in ruby crystal rust julia python nodejs deno pnpm go haskell; do rtx global $plugin@latest; done
sudo pacman -S cbqn-git sqlite mysql postgresql --noconfirm

# configure installed
echo "$(rtx ls | sed -E -e 's/⏵ *| *\([a-z ~\/.-]*\)//g')" > ~/.tool-versions

# install utils cli tools
yay -S vhs gum glow slides nodejs-live-server httpie --noconfirm
go install github.com/maaslalani/nap@main
go install github.com/maaslalani/draw@main
go install github.com/maaslalani/crow@master

# install TPM
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# install rust cli-alternatives
cargo install bat exa tokei hyperfine ytop zoxide xcp rm-improved ripgrep fd-find grex git-delta pier hx swc

# install lsps
yay -S {bash,typescript,yaml,svelte,haskell}-language-server vscode-langservers-extracted {marksman,crystalline}-bin clang rust-analyzer taplo-cli gopls --noconfirm
gem install solargraph
pnpm i -g pyright @astrojs/language-server @prisma/language-server eslint
