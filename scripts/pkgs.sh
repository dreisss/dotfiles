#!/bin/bash

# install default languages/tools
for plugin in ruby crystal python julia go haskell rust zig lua deno node pnpm yarn; do rtx use -g $plugin@latest; done
yay -S cbqn-git sqlite mysql postgresql --noconfirm

# install utils cli tools
yay -S vhs gum glow slides nodejs-live-server httpie lazygit --noconfirm
go install github.com/maaslalani/nap@main
go install github.com/maaslalani/draw@main
go install github.com/maaslalani/crow@master

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

# install TPM
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# install rust cli-alternatives
cargo install bat exa tokei hyperfine ytop zoxide xcp rm-improved ripgrep fd-find grex git-delta pier hx

# install lsps and formatters
yay -S {bash,typescript,yaml,svelte,haskell,lua}-language-server {marksman,crystalline}-bin vscode-langservers-extracted clang gopls zls-bin taplo-cli --noconfirm
pnpm i -g pyright @astrojs/language-server @prisma/language-server eslint
gem install solargraph
rustup component add rust-analyzer
julia -e 'using Pkg; Pkg.add("LanguageServer")'
