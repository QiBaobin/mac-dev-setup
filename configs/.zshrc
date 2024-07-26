export PATH="$HOME/bin:$HOME/homebrew/bin:$HOME/homebrew/sbin:$HOME/.cargo/bin:$JAVA_HOME/bin:$HOME/homebrew/opt/coreutils/libexec/gnubin:$HOME/homebrew/opt/gawk/libexec/gnubin:$HOME/.local/bin:/usr/local/bin:$PATH"

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands

PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

[ -d ~/.zsh ] || mkdir ~/.zsh
[ -d ~/.zsh/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -d ~/.zsh/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting && source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls=eza
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias !!='fc -ln -1'

function fh() {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
