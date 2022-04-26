autoload -Uz compinit && compinit
set -o emacs

alias startavd="$ANDROID_SDK_ROOT/emulator/emulator -no-skin -no-audio '@Pixel_2_API_31' > /dev/null 2>&1 &"

export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$HOME/.cargo/bin:$HOME/bin:$JAVA_HOME/bin:$PATH:/Users/a483334/.local/share/nvim/lsp_servers/kotlin/server/bin/"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

function set_win_title(){
    echo -ne "\033]0; ${PWD##/*/} \007"
}
precmd_functions+=(set_win_title)

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
