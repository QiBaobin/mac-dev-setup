autoload -Uz compinit && compinit
set -o emacs

alias cargo-install-update="cargo install --list | rg -e '^(\S+).*' -r '\$1' | xargs cargo install"

eval "$(starship init zsh)"
function set_win_title(){
    echo -ne "\033]0; ${PWD##/*/} \007"
}
precmd_functions+=(set_win_title)

eval "$(zoxide init zsh)"

source ~/.zsh/skim.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
