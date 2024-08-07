{ config, pkgs, ... }:

{
  home = {
    stateVersion = "24.05";

    packages = with pkgs; [
      alacritty-theme
      aspell
      gawk
      gh
      gnused
      nerdfonts
      jq
      kakoune
      nil
      parallel
      skhd
      universal-ctags
      yabai
      zsh-powerlevel10k
    ];

    shellAliases = {
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gf = "git fetch origin main";
      gr = "git rebase -i origin/main";
      gR = "git reset --hard origin/main";
      gp = "git push origin @:refs/heads/story/PAMPP-";
      "!!" = "fc -ln -1";
      choose-theme = ''ls "${pkgs.alacritty-theme}" | sk | awk '{system("ln -sf \"" "${pkgs.alacritty-theme}/" $0 "\" ~/.config/alacritty/local.toml")}' '';
    };

    sessionVariables = {
      PATH = "$PATH:$HOME/homebrew/bin";
      EDITOR = "kak";
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
      shortcut = "g";
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "screen-256color";
      extraConfig = ''
        set -g renumber-windows on
        set -g set-titles on
        bind '"' split-window -c "#{pane_current_path}"
        bind % split-window -hc "#{pane_current_path}"
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
        bind T choose-tree -Z
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
        bindkey "^X^E" edit-command-line

        for f in "$HOME/.config/zsh"/*.zsh; do
          [[ -e "$f" ]] || continue
          source "$f"
        done
      '';
      plugins = [
        {
          name = "p10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];
    };
    eza.enable = true;
    git = {
      enable = true;
      delta.enable = true;
      userName = "Bob Qi";
      userEmail = "devup@qq.com";
      extraConfig = {
        includeIf."gitdir:~/work/" = {
          path = "~/work/.gitconfig";
        };
      };
    };
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

        window = {
          dynamic_title = true;
          decorations = "None";
          opacity = 0.9;
          option_as_alt = "OnlyLeft";
          startup_mode = "Maximized";
        };
      };
    };
  };

  xdg.configFile = with builtins; {
    "skhd/skhdrc".text = readFile ./skhd/skhdrc;
    "yabai/yabairc".text = readFile ./yabai/yabairc;
    "kak/kakrc".text = readFile ./kak/kakrc;
    "nix/nix.conf".text = readFile ./nix/nix.conf;
    "zsh/android.zsh".text = readFile ./zsh/android.zsh;
    "zsh/.p10k.zsh".text = readFile ./zsh/.p10k.zsh;
  };
}
