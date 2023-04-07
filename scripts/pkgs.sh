#!/bin/bash

# install default languages/tools
for plugin in ruby rust julia python nodejs deno pnpm; do rtx global $plugin@latest; done
sudo pacman -S postgresql mysql sqlite --noconfirm

# configure installed
echo "$(rtx ls | sed -E -e 's/⏵ *| *\([a-z ~\/.-]*\)//g')" > ~/.tool-versions

# install rust cli-alternatives
cargo install bat exa tokei hyperfine ytop zoxide xcp rm-improved ripgrep fd-find grex git-delta xh dprint pier hx paru

# install lsps
yay -S {bash,typescript,yaml}-language-server clang vscode-{css,html,json}-languageserver marksman-bin ruby-solargraph rust-analyzer taplo-cli --noconfirm
