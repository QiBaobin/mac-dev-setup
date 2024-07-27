# mac-dev-setup
scripts to setup my mac development enviroment

## List

### Text Editor
[kakoune](https://github.com/mawww/kakoune)
[config](https://github.com/QiBaobin/mac-dev-setup/blob/master/configs/kak/kakrc)
[Philosophy](http://kakoune.org/why-kakoune/why-kakoune.html)

### Terminal
- [wezterm](https://github.com/wez/wezterm)
[config](https://github.com/QiBaobin/mac-dev-setup/blob/master/configs/wezterm/wezterm.lua)
- [alacritty](https://github.com/alacritty/alacritty) [config](https://github.com/QiBaobin/mac-dev-setup/blob/master/configs/alacritty/alacritty.toml)
  
### Shell
[zsh](https://www.zsh.org/)
[config](https://github.com/QiBaobin/mac-dev-setup/blob/master/configs/.zshrc)

### Terminal multiplexer
[tmux](https://github.com/tmux/tmux/)
[config](https://github.com/QiBaobin/mac-dev-setup/blob/master/configs/tmux/tmux.conf)

### Window Manager
- [yabai](https://github.com/koekeishiya/yabai)
[config](https://github.com/QiBaobin/mac-dev-setup/blob/master/configs/.yabairc)
- [skhd](https://github.com/koekeishiya/skhd/)
[config](https://github.com/QiBaobin/mac-dev-setup/blob/master/configs/.skhdrc)

### Tools
- Search [ripgrep](https://github.com/BurntSushi/ripgrep)
- Find file [fd](https://github.com/sharkdp/fd)
- Code navigation [ctags](https://github.com/universal-ctags/ctags)
- Change directory [zoxide](https://github.com/ajeetdsouza/zoxide)
- Interactive search [skim](https://github.com/lotabout/skim) [fzf](https://github.com/junegunn/fzf)
- Shell prompt [starship](https://github.com/starship/starship)
- File Manager [yazi](https://github.com/sxyazi/yazi)
- Command Runner [just](https://github.com/casey/just) [config](https://github.com/QiBaobin/mac-dev-setup/blob/master/configs/justfile)
- Task Manager [pueue](https://github.com/Nukesor/pueue)
- Software Upgrade [topgrade](https://github.com/topgrade-rs/topgrade)
- Print files [bat](https://github.com/sharkdp/bat)
- Counter down timer [termdown](https://github.com/trehn/termdown)
- Count lines of code [loc](https://github.com/cgag/loc)

### Programming
- [zig](https://ziglang.org/)
- Javascript runtime, a better nodejs replacement [bun](https://github.com/oven-sh/bun)

### Fonts
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts)
- [Cascadia code](https://github.com/microsoft/cascadia-code)
- [Input Mono](https://input.djr.com/)
- [Fira Code](https://github.com/tonsky/FiraCode)

### Web browser extensions
- Chrome keyborad enhencement [Surfingkeys](https://github.com/brookhong/Surfingkeys)
- Firefox vim interface [tridactyl](https://github.com/tridactyl/tridactyl)
- Ad blocker [adblock plus](https://adblockplus.org/)
  
## Development enviroments
### Nix

#### Install
Need sudo
```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
# or use offical installer: sh <(curl -L https://nixos.org/nix/install)
```
#### Setup proxy [optional]
Add http_proxy and https_proxy in /Library/LaunchDaemons/org.nixos.nix-daemon.plist

### Hermit
[hermit](https://github.com/cashapp/hermit)
```sh
curl -fsSL https://github.com/cashapp/hermit/releases/download/stable/install.sh | /bin/bash
```

## Install

### nix
```sh
mkdir $HOME/.config; cp -Rv configs/ $HOME/.config/

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix run home-manager/master -- switch

```

### homebrew
```sh
mkdir $HOME/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/homebrew
mkdir "$HOME/Applications"
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
export PATH="$HOME/homebrew/bin:$PATH"

brew install git tmux fzf fd ripgrep zsh font-hack-nerd-font font-inconsolata font-input font-monaspace just pueue universal-ctags zoxide
brew install --HEAD kakoune
brew install --cask wezterm@nightly
brew install koekeishiya/formulae/yabai koekeishiya/formulae/skhd

mkdir $HOME/.config; cp -Rv configs/ $HOME/.config/
skhd --start-service
yabai --start-service
```


