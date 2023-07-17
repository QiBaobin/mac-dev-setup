export PATH="$HOME/bin:$HOME/homebrew/bin:$HOME/homebrew/sbin:$HOME/.cargo/bin:$JAVA_HOME/bin:$HOME/homebrew/opt/coreutils/libexec/gnubin:$HOME/homebrew/opt/gawk/libexec/gnubin:$PATH"

autoload -Uz compinit && compinit
setopt incappendhistory

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

function set_win_title(){
    echo -ne "\033]0; ${PWD##/*/} \007"
}
precmd_functions+=(set_win_title)

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.cargo/registry/src/github.com-1ecc6299db9ec823/skim-0.10.2/shell/key-bindings.zsh
source ~/.cargo/registry/src/github.com-1ecc6299db9ec823/skim-0.10.2/shell/completion.zsh


alias ls=exa
alias gs='git status'
alias ga='git add'
alias gc='git commit'
