{  pkgs, ... }:

{
  home = {
    stateVersion = "24.05";

    packages = with pkgs; [
      alacritty-theme
      aspell
      aspellDicts.en
      aspellDicts.en-computers
      neovim
      jq
      nil
      universal-ctags
      zsh-powerlevel10k
    ] ++ (if stdenv.isDarwin then [
      alacritty
      btop
      gawk
      gnused
      nerdfonts
      util-linuxMinimal
    ] else  []);

    shellAliases = {
      v = "nvim";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gf = "git fetch origin main";
      gr = "git rebase -i origin/main";
      gR = "git reset --hard origin/main";
      gp = "git push origin @:refs/heads/story/PAMPP-";
      "!!" = "fc -ln -1";
      choose-theme = ''ls "${pkgs.alacritty-theme}" | sk | awk '{system("ln -sf \"" "${pkgs.alacritty-theme}/" $0 "\" ~/.config/alacritty/local.toml")}' '';
      nix-locate = "nix run github:nix-community/nix-index-database bin/";
      direnv-init = "nix flake init --template github:nix-community/nix-direnv";
      devenv-init = "nix flake init --template github:cachix/devenv#flake-parts";
    };

    sessionVariables = {
      LANG = "en_US.UTF-8";
      EDITOR = "nvim";
      HOMEBREW_CASK_OPTS = "--appdir=$HOME/Applications";
      SKIM_CTRL_T_COMMAND = "fd";
    };
    sessionPath = [ "$HOME/homebrew/bin" "$HOME/.local/bin" ];
    sessionVariablesExtra = ''
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then 
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
      if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec prime-run Hyprland
      fi
    '';
  };

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    tmux = {
      enable = true;
      sensibleOnTop = false;
      escapeTime = 0;
      keyMode = "vi";
      shortcut = "q";
      shell = "${pkgs.zsh}/bin/zsh";
      extraConfig = ''
        set -a terminal-features 'xterm-256color:RGB'
        set -g default-terminal "$TERM"
        set -g renumber-windows on
        set -g set-titles on
        set -g status off
        set -g focus-events on
        bind '"' split-window -c "#{pane_current_path}"
        bind % split-window -hc "#{pane_current_path}"
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
        bind T choose-tree -Z
        new -d -s tools
        bind-key b command-prompt "new-window -t tools %%"
      '';
    };

    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      completionInit = "autoload -U compinit && compinit -i";
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initExtra = ''
        autoload -z edit-command-line
        zle -N edit-command-line
        bindkey -e
        bindkey "^X^E" edit-command-line
        bindkey "^p" history-search-backward
        bindkey "^n" history-search-forward
        bindkey "^Q" push-input
        zstyle ':completion:*' completer _expand_alias _complete _ignored

        source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"
        for f in "$HOME/.config/zsh"/{,.}*.zsh; do
          [[ -e "$f" ]] && source "$f"
        done
      '';
    };
    eza.enable = true;
    git = {
      enable = true;
      delta.enable = true;
      userName = "Bob Qi";
      userEmail = "devup@qq.com";
      ignores = [ "tags" ".direnv" ".kak*" ".envrc" ".aider*" ];
      includes = [
        {
          condition = "gitdir:~/work/";
          path = "~/work/.gitconfig";
        }
      ];
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    gh.enable = true;
    skim = {
      enable = true;
      defaultCommand = "fd --type f || git ls-tree -r --name-only HEAD || rg --files || find .";
    };
    ripgrep.enable = true;
    fd.enable = true;
    zoxide.enable = true;
    bat.enable = true;
  };
}
