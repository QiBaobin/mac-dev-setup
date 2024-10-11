{  pkgs, ... }:

{
  home = {
    stateVersion = "24.05";

    packages = with pkgs; [
      alacritty-theme
      aspell
      aspellDicts.en
      aspellDicts.en-computers
      btop
      gawk
      gnused
      neovim
      nerdfonts
      jq
      nil
      universal-ctags
      util-linuxMinimal
      zsh-powerlevel10k
    ] ++ (if stdenv.isDarwin then [] else  []);

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
      PATH = "$PATH:$HOME/homebrew/bin";
      EDITOR = "nvim";
      HOMEBREW_CASK_OPTS = "--appdir=$HOME/Applications";
    };
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
      shortcut = "space";
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
    skim.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    zoxide.enable = true;
    bat.enable = true;
    alacritty = {
      enable = true;
      settings = {
        font = {
          size = 16.0;
          normal.family = "Hack Nerd Font Mono";
        };
        cursor = {
          style = {
            shape = "Beam";
            blinking = "On";
          };
          vi_mode_style = {
            shape = "Underline";
            blinking = "On";
          };
        };

        window = {
          dynamic_title = true;
          decorations = "None";
          opacity = 0.9;
          option_as_alt = "OnlyLeft";
          startup_mode = "Maximized";
        };
        hints.enabled = [
          {
            action = "Copy";
            hyperlinks = true;
            post_processing = true;
            persist = false;
            mouse.enabled = true;
            binding = { key = "U"; mods = "Control|Shift"; };
            regex = ''(ipfs:|ipns:|magnet:|mailto:|gemini://|gopher://|https://|http://|news:|file:|git://|ssh:|ftp://)[^\u0000-\u001F\u007F-\u009F<>"\\s{-}\\^⟨⟩`]+'';
          }
        ];
      };
    };
  };
}
