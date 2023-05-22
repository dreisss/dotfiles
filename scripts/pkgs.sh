#!/bin/bash

# install default languages/tools
for plugin in ruby crystal python julia go haskell rust zig deno node pnpm yarn; do rtx use -g $plugin@latest; done
yay -S cbqn-git sqlite mysql postgresql --noconfirm

# install utils cli tools
yay -S vhs gum glow slides nodejs-live-server httpie --noconfirm
go install github.com/maaslalani/nap@main
go install github.com/maaslalani/draw@main
go install github.com/maaslalani/crow@master

# install TPM
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# install rust cli-alternatives
cargo install bat exa tokei hyperfine ytop zoxide xcp rm-improved ripgrep fd-find grex git-delta pier hx

# install lsps and formatters
yay -S {bash,typescript,yaml,svelte,haskell}-language-server {marksman,crystalline}-bin vscode-langservers-extracted clang rust-analyzer gopls zls-bin taplo-cli --noconfirm
gem install solargraph
pnpm i -g pyright @astrojs/language-server @prisma/language-server eslint
