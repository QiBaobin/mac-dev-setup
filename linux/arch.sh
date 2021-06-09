# install packages
sudo pacman -S herbstluftwm rofi alacritty ttf-fira-code dzen2 ctags rustup rust-analyzer zsh zsh-autosuggestions zsh-syntax-highlighting starship bat ripgrep fd firefox wqy-microhei skim git xclip base-devel sudo cmake unzip ninja tree-sitter python-pip

mkdir -p ~/.config; cp -Rv ../config/nvim ~/.config/

mkdir ~/git ~/.local; git clone --depth 1 https://github.com/neovim/neovim.git ~/git/neovim; cd ~/git/neovim && make CMAKE_INSTALL_PREFIX=~/.local/ install && cd -
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# all dot files
cp -Rv dots/.* ~/
~/.local/bin/nvim +PackerInstall +PackerCompile +qa
pip install neovim-remote
