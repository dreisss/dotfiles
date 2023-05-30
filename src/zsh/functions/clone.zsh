function _clone() {
  compadd $(gh repo list | awk '{print $1}')
}

function clone() {
  gh repo clone $(gum choose $(gh repo list | awk '{print $1}'))
}

compdef _clone clone
