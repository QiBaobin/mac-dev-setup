{ config, pkgs, ... }:

{
  home = {
      stateVersion = "24.05";

      packages = with pkgs; [
        alacritty-theme
        difftastic
        gh
        nil
        skhd
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
      extraConfig = ''
        source "%val{config}/realrc"
      '';
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
        bind '"' split-window -c "#{pane_current_path}"
        bind % split-window -hc "#{pane_current_path}"
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
        bind t choose-tree -Z
      '';
    };

    zsh = {
      enable = true;
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
      };
    };
    eza.enable = true;
    starship.enable = true;
    git = {
      enable = true;
      delta.enable = true;
      # difftastic.enable = true;
    };
    skim.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    zoxide.enable = true;
    bat.enable = true;
    alacritty = {
      enable = true;
      settings = {
        import = [ "${pkgs.alacritty-theme}/alabaster.toml" ];
        font = {
          size = 16.0;
          normal.family = "Cascadia Code";
        };

        window = {
          dynamic_title = true;
          opacity = 0.9;
          option_as_alt = "OnlyLeft";
          startup_mode = "Maximized";
        };
      };
    };
  };
}
