autoload -Uz compinit && compinit
set -o emacs

alias cargo-install-update="cargo install --list | rg -e '^(\S+).*' -r '\$1' | xargs cargo install"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

source ~/.zsh/skim.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
