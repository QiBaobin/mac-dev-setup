# mac-dev-setup
scripts to setup my mac development enviroment

## List

### Editor
[kakoune](https://github.com/mawww/kakoune)
[config](https://github.com/QiBaobin/mac-dev-setup/blob/master/configs/kak/kakrc)
[Philosophy](http://kakoune.org/why-kakoune/why-kakoune.html)

### Terminal
[wezterm](https://github.com/wez/wezterm)
[config](https://github.com/QiBaobin/mac-dev-setup/blob/master/configs/wezterm/wezterm.lua)

### Shell
[zsh](https://www.zsh.org/)
[config](https://github.com/QiBaobin/mac-dev-setup/blob/master/configs/.zshrc)

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
- Interactive search [skim](https://github.com/lotabout/skim)
- Shell prompt [starship](https://github.com/starship/starship)
- File Manager [yazi](https://github.com/sxyazi/yazi)
- Command Runner [just](https://github.com/casey/just) [config](https://github.com/QiBaobin/mac-dev-setup/blob/master/configs/justfile)
- Task Manager [pueue](https://github.com/Nukesor/pueue)
- Software Upgrade [topgrade](https://github.com/topgrade-rs/topgrade)
- Print files [bat](https://github.com/sharkdp/bat)
- Counter down timer [termdown](https://github.com/trehn/termdown)
- Count lines of code [loc](https://github.com/cgag/loc)

### Programming
- Project Setup [hermit](https://github.com/cashapp/hermit)
- [zig](https://ziglang.org/)

### Fonts
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts)
- [Cascadia code](https://github.com/microsoft/cascadia-code)
- [Input Mono](https://input.djr.com/)
- [Fira Code](https://github.com/tonsky/FiraCode)
  
## Install

``` sh
cd scripts && chmod +x ./* && ./setup_all.sh
```

If you only need setup some of them, just run related shell scripts.
