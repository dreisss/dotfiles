export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP="$ZSH/cache/.zcompdump-$HOST"
export HISTFILE="$ZSH/cache/.zsh_history"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config '~/.files/src/oh-my-posh.omp.json')"
eval "$(~/.local/share/rtx/bin/rtx activate -s zsh)"
eval "$(~/.local/share/rtx/installs/rust/1.68.0/bin/zoxide init zsh)"

export EDITOR="$(which helix)"
export VISUAL="$(which helix)"

alias cd="z"
alias cp="xcp"
alias rm="rip"
alias l="exa -l --icons"
alias ls="exa --icons"
alias cat="bat"
alias grep="rg"
alias diff="delta"
alias find="fd"
alias htop="ytop"
alias shell="oh-my-posh get shell"
alias zell="zellij"
alias hexdump="$(rtx which hx)"
alias hx="helix"
