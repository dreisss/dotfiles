function _note() {
  compadd $(exa ~/notebooks)
}

function note() {
  cd ~/notebooks/$@
}

compdef _note note
