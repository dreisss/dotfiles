function _note_notebooks() {
  _files -W ~/notebooks/
}

function _note() {
  _arguments -s \
    '1:notebook:_note_notebooks'
}

function note() {
  cd ~/notebooks/$@
}

compdef _note note
