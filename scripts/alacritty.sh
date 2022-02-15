
#!/usr/bin/env bash

if [ -z "$alacritty_load" ]; then
    mkdir ~/code; git clone https://github.com/alacritty/alacritty.git
    cd ~/code/alacritty; make app; cd -

    alacritty_load=1
fi
