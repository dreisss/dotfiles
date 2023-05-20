export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP="$ZSH/cache/.zcompdump-$HOST"
export HISTFILE="$ZSH/cache/.zsh_history"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source ~/.oh-my-zsh/custom/catppuccin_macchiato-zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config '~/.dotfiles/src/oh-my-posh/oh-my-posh.omp.json')"
eval "$(~/.local/share/rtx/bin/rtx activate -s zsh)"
eval "$($(rtx which zoxide) init zsh)"

export EDITOR="$(which helix)"
export VISUAL="$(which helix)"

alias cd="z"
alias cp="xcp"
alias rm="rip"
alias l="exa -l --icons -s type"
alias ls="exa --icons -s type"
alias la="exa -la --icons -s type"
alias cat="bat"
alias grep="rg"
alias diff="delta"
alias find="fd"
alias zell="zellij"
alias hexdump="$(rtx which hx)"
alias hx="helix"
alias repo="cd ~/repos/\$@"

# pnpm
export PNPM_HOME="/home/dreisss/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
