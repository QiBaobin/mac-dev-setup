# install packages
sudo pacman -S herbstluftwm rofi alacritty ttf-fira-code dzen2 ctags rustup rust-analyzer zsh zsh-autosuggestions zsh-syntax-highlighting starship firefox wqy-microhei skim

# setup neovim
old_pwd="$PWD"
mkdir ~/.cache; cd ~/.cache && git clone https://aur.archlinux.org/neovim-nightly-bin.git; cd neovim-nightly-bin; makepkg -i
cd "$old_pwd"

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config; cp -Rv ../config/nvim ~/.config/
# use fastgit instead github if installing plugins too slow
# sed -i -e 's/github.com/hub.fastgit.org/g' "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim


# all dot files
cp -Rv dots/* ~/
