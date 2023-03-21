autoload -Uz compinit && compinit
set -o vi

# need setup PATH here instead of .zshenv https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/homebrew/bin:$HOME/homebrew/sbin:$JAVA_HOME/bin:$PATH"

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


SSH_AGENT_ENV="$HOME/.ssh-agent.env" 
if [ -f  "$SSH_AGENT_ENV" ]; then
    source "$SSH_AGENT_ENV"
fi
function sa(){
    ssh-agent > "$SSH_AGENT_ENV"
    source "$SSH_AGENT_ENV"
    ssh-add
}
alias ls=exa
printf '\033[3 q'
