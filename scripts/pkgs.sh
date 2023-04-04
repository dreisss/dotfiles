#!/bin/bash

# install default languages/tools
rtx global {ruby,rust,julia,python,nodejs,deno,bun,pnpm}@latest
sudo pacman -S postgresql mysql sqlite --noconfirm
yay -S cbqn-git gnu-apl j901-bin --noconfirm

# install alternative code editors
yay -S neovim visual-studio-code-bin --noconfirm
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

# configure installed
echo "$(rtx ls | sed -E -e 's/⏵ *| *\([a-z ~\/.-]*\)//g')" > ~/.tool-versions

# install rust cli-alternatives
cargo install bat exa tokei hyperfine ytop zoxide xcp rm-improved ripgrep fd-find grex git-delta xh dprint pier hex

# install lsps
yay -S bash-language-server clang vscode-{css,html,json}-languageserver typescript-language-server marksman-bin ruby-solargraph rust-analyzer taplo-cli yaml-language-server --noconfirm
julia -e 'using Pkg; Pkg.add("LanguageServer")'
