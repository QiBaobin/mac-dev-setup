export PATH="$HOME/bin:$HOME/homebrew/bin:$HOME/homebrew/sbin:$HOME/.cargo/bin:$JAVA_HOME/bin:$HOME/homebrew/opt/coreutils/libexec/gnubin:$HOME/homebrew/opt/gawk/libexec/gnubin:$HOME/.local/bin:/usr/local/bin:$PATH"

autoload -Uz compinit && compinit
setopt incappendhistory

zle_highlight=(region:bg=black,fg=magenta,bold)
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

mkdir ~/.zsh
[ -d ~/.zsh/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -d ~/.zsh/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting && source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls=eza
alias gs='git status'
alias ga='git add'
alias gc='git commit'
