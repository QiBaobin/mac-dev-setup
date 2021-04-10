autoload -Uz compinit && compinit
set -o emacs

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source /usr/share/skim/key-bindings.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
