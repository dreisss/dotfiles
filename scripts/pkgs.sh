#!/bin/bash

# install default languages/tools
for plugin in ruby crystal rust julia python nodejs deno pnpm; do rtx global $plugin@latest; done
sudo pacman -S sqlite mysql postgresql --noconfirm

# configure installed
echo "$(rtx ls | sed -E -e 's/⏵ *| *\([a-z ~\/.-]*\)//g')" > ~/.tool-versions

# install rust cli-alternatives
cargo install bat exa tokei hyperfine ytop zoxide xcp rm-improved ripgrep fd-find grex git-delta xh dprint pier hx swc

# install lsps
yay -S {bash,typescript,yaml,svelte}-language-server vscode-{css,html,json}-languageserver {marksman,crystalline}-bin clang rust-analyzer taplo-cli --noconfirm
pip install -U 'python-lsp-server[all]'
gem install solargraph
pnpm add -g @astrojs/language-server
