export PATH="$HOME/bin:$HOME/homebrew/bin:$HOME/homebrew/sbin:$HOME/.cargo/bin:$JAVA_HOME/bin:$HOME/homebrew/opt/coreutils/libexec/gnubin:$HOME/homebrew/opt/gawk/libexec/gnubin:$PATH"

autoload -Uz compinit && compinit
setopt incappendhistory

zle_highlight=(region:bg=black,fg=magenta,bold)
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

function set_win_title(){
    echo -ne "\033]0; ${PWD##/*/} \007"
}
precmd_functions+=(set_win_title)

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export CARAPACE_BRIDGES='zsh,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

alias ls=eza
alias gs='git status'
alias ga='git add'
alias gc='git commit'
