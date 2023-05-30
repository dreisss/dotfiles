function _repo() {
  compadd $(exa ~/repos)
}

function repo() {
  cd ~/repos/$@
}

compdef _repo repo
