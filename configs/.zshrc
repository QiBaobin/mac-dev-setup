autoload -Uz compinit && compinit
set -o vi

alias startavd="$ANDROID_SDK_ROOT/emulator/emulator -no-skin -no-audio '@Pixel_2_API_31' > /dev/null 2>&1 &"

export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$HOME/.cargo/bin:$HOME/bin:$JAVA_HOME/bin:$PATH:/Users/a483334/.local/share/nvim/lsp_servers/kotlin/server/bin/"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

function set_win_title(){
    echo -ne "\033]0; ${PWD##/*/} \007"
}
precmd_functions+=(set_win_title)

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zle.zsh
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
eval $(thefuck --alias)
