autoload -Uz compinit && compinit
set -o emacs

alias cargo-install-update="cargo install --list | rg -e '^(\S+).*' -r '\$1' | xargs cargo install"

export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$HOME/.cargo/bin:$HOME/bin:$JAVA_HOME/bin:$HOME/code/kotlin-language-server/server/build/install/server/bin/:$PATH"

eval "$(starship init zsh)"
function set_win_title(){
    echo -ne "\033]0; ${PWD##/*/} \007"
}
precmd_functions+=(set_win_title)

eval "$(zoxide init zsh)"

source ~/.zsh/skim.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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
