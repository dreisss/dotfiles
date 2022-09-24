function installFish {
  sudo apt-add-repository ppa:fish-shell/release-3
  sudo apt update
  sudo apt install fish
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
  sudo apt install git-flow
}

function getDotFiles {
  git clone "https://github.com/dreisss/.files.git" "~/.files"
}

function createLinks {
  ln ~/.files/.gitconfig ~/.gitconfig
}

# === === ==== ==== running
installFish
installStarship
installASDF
installGitFlow

getDotFiles
createLinks
