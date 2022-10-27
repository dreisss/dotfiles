# --> configure terminal
function installFish {
  sudo apt-add-repository ppa:fish-shell/release-3 -y
  sudo apt update -y
  sudo apt install fish -y
  chsh -s $(which fish)
  fish
}

function installStarship {
  curl -sS 'https://starship.rs/install.sh' | sh
  echo "starship init fish | source" >> ~/.config/fish/config.fish
  source ~/.config/fish/config.fish
}

# --> install essential
function installEssential {
  sudo apt update -y
  sudo apt install -y build-essential make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev wget curl llvm git git-flow
  sudo apt upgrade -y
}

function installASDF {
  git clone 'https://github.com/asdf-vm/asdf.git' ~/.asdf --branch v0.10.2
  echo "source ~/.asdf/asdf.fish" >> ~/.config/fish/config.fish
  mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
  source ~/.config/fish/config.fish
}

# --> install languages
function installRust {
  asdf plugin add rust
  asdf install rust latest
  asdf global rust latest
  fish_add_path ~/.asdf/installs/rust/1.64.0/bin
}

function installRuby {
  asdf plugin add ruby
  asdf install ruby latest
  asdf global ruby latest
}

function installNode {
  asdf plugin add nodejs
  asdf install nodejs latest
  asdf global nodejs latest
}

function installPython {
  asdf plugin add python
  asdf install python latest
  asdf global python latest
}

# --> install rust-alternatives
function installRustAlternatives {
  cargo install bat exa tokei hyperfine ytop
}

function createRustAlternativeAliases {
  echo 'alias cat="bat"' >> ~/.config/fish/config.fish
  echo 'alias ls="exa --icons"' >> ~/.config/fish/config.fish
  echo 'alias top="ytop"' >> ~/.config/fish/config.fish
  source ~/.config/fish/config.fish
}

# --> install lunarvim
function installNeoVim {
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt update
  sudo apt install neovim -y
}

function installLunarVim {
  curl -s 'https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh' | bash
  fish_add_path ~/.local/bin
}

# --> get dotfiles
function getDotFiles {
  git clone 'https://github.com/dreisss/.files.git' ~/.files
}

function createLinks {
  ln ~/.files/.gitconfig ~/.gitconfig
}

function updatePackages {
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt autoremove -y
}
