REPOS=$(gh repo list | awk '{print $1}')

function _clone_repositories() {
  compadd $(echo $REPOS)
}

function _clone() {
  _arguments -s \
    '1:repository:_clone_repositories'
}

function clone() {
  gh repo clone $@
}

compdef _clone clone
