function installFish {
  sudo apt-add-repository ppa:fish-shell/release-3 -y
  sudo apt update -y
  sudo apt install fish -y
  chsh -s $(which fish)

  fish
}

function installStarship {
  curl -sS https://starship.rs/install.sh | sh
  echo "starship init fish | source" >> ~/.config/fish/config.fish

  source ~/.config/fish/config.fish
}

function installASDF {
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
  echo "source ~/.asdf/asdf.fish" >> ~/.config/fish/config.fish
  mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

  source ~/.config/fish/config.fish
}

function installGitFlow {
  sudo apt install git-flow -y
}

function installRust {
  asdf plugin add rust
  asdf install rust latest
  asdf global rust latest
  fish_add_path ~/.asdf/installs/rust/1.64.0/bin
}

function installCliTools {
  sudo apt install build-essential -y
  cargo install bat exa tokei hyperfine ytop
}

function createCliAliases {
  echo 'alias cat="bat"' >> ~/.config/fish/config.fish
  echo 'alias ls="exa --icons"' >> ~/.config/fish/config.fish
  echo 'alias top="ytop"' >> ~/.config/fish/config.fish

  source ~/.config/fish/config.fish
}

function installPython {
  sudo apt-get install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
  asdf plugin add python
  asdf install python latest
  asdf global python latest
}

function installNode {
  asdf plugin add nodejs
  asdf install nodejs latest
  asdf global nodejs latest
}

function getDotFiles {
  git clone https://github.com/dreisss/.files.git ~/.files
}

function createLinks {
  ln ~/.files/.gitconfig ~/.gitconfig
}

function updatePackages {
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt install build-essential -y
  sudo apt autoremove -y
}
