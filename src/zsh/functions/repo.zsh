function _repo_repositories() {
  _files -W ~/repos/
}

function _repo() {
  _arguments -s \
    '1:repository:_repo_repositories'
}

function repo() {
  cd ~/repos/$@
}

compdef _repo repo
