
#!/usr/bin/env bash

if [ -z "$helix_load" ]; then
    mkdir ~/code; git clone https://github.com/alacritty/alacritty.git
    cd ~/code/alacritty; make app; cd -

    helix_load=1
fi
