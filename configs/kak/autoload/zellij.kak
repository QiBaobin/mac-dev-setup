# https://zellij.dev/
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

provide-module zellij %{

# ensure we're running under zellij
evaluate-commands %sh{
    [ -z "${kak_opt_windowing_modules}" ] || [ -n "$ZELLIJ" ] || echo 'fail zellij not detected'
}

define-command -hidden -params 1.. zellij %{
    evaluate-commands %sh{
       zellij "$@" < /dev/null > /tmp/zellij.log 2>&1 &
    }
}

define-command -hidden -params 1.. zellij-terminal-impl %{
   zellij run %arg{@}
}

define-command zellij-terminal-vertical -params 1.. -docstring '
zellij-terminal-vertical <program> [<arguments>]: create a new terminal as a zellij pane
The current pane is split into two, top and bottom
The program passed as argument will be executed in the new terminal' \
%{
    zellij-terminal-impl -d down -- %arg{@}
}
complete-command zellij-terminal-vertical shell

define-command zellij-terminal-horizontal -params 1.. -docstring '
zellij-terminal-horizontal <program> [<arguments>]: create a new terminal as a zellij pane
The current pane is split into two, left and right
The program passed as argument will be executed in the new terminal' \
%{
    zellij-terminal-impl -d right -- %arg{@}
}
complete-command zellij-terminal-horizontal shell

define-command zellij-terminal-window -params 1.. -docstring '
zellij-terminal-window <program> [<arguments>] [<arguments>]: create a new terminal as a zellij window
The program passed as argument will be executed in the new terminal' \
%{
    zellij-terminal-impl -- %arg{@}
}
complete-command zellij-terminal-window shell

define-command zellij-terminal-window-edit -params .. -docstring '
zellij-terminal-window-edit <file>: create a new window to edit given file' \
%{
    zellij-terminal-impl -c -- kak -c %val{session} %arg{@}
}
complete-command zellij-terminal-window-edit file

define-command zellij-focus -params 0 -docstring '
zellij-focus: focus a panel' \
%{
    zellij action switch-mode pane
}

## The default behaviour for the `new` command is to open an horizontal pane in a zellij session
alias global focus zellij-focus
alias global terminal zellij-terminal-window
alias global window-edit zellij-terminal-window-edit

}

