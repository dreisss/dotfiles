COMMANDS=$(awk -F '.' '$0 ~ /\[\w*\.\w+\]/ { print $2 }' ~/.dotfiles/src/pier/config.toml | /bin/grep -o -E '\w+')

function _run_commands() {
  compadd $(echo $COMMANDS)
}

function _run() {
  _arguments -s \
    '1:command:_run_commands' \
    '*:argument:_path_files'
}

function run() {
  pier run $@
}

compdef _run run
