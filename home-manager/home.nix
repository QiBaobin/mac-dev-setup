{ config, pkgs, ... }:

{
  home = {
      stateVersion = "24.05";

      packages = with pkgs; [
        alacritty-theme
        aspell
        configs
        gh
        jq
        nil
        skhd-config
        universal-ctags
        yabai
      ];
  };

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    kakoune = {
      enable = true;
      defaultEditor = true;
      extraConfig = builtins.readFile ./configs/kak/kakrc;
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
      sessionVariables = {
        PATH = "$PATH:$HOME/homebrew/bin";
      };
      shellAliases = {
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gf = "git fetch origin main";
        gr = "git rebase -i origin/main";
        gp = "git push origin @:refs/heads/story/PAMPP-";
        "!!" = "fc -ln -1";
        choose-theme = ''ls "${pkgs.alacritty-theme}" | sk | awk '{print "${pkgs.alacritty-theme}/" $0}' | xargs -J % ln -sf % ~/.config/alacritty/local.toml'';
      };
      initExtra = ''
       autoload -z edit-command-line
       zle -N edit-command-line
       bindkey "^X^E" edit-command-line

        function set_win_title(){
            echo -ne "\033]0; ''${PWD##/*/} \007"
        }
        precmd_functions+=(set_win_title)
        for f in "$HOME/.config/zsh"/*.zsh; do
        [[ -e "$f" ]] || continue
          source "$f"
        done
      '';
    };
    eza.enable = true;
    starship.enable = true;
    git = {
      enable = true;
      delta.enable = true;
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
          normal.family = "Cascadia Code";
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
}
