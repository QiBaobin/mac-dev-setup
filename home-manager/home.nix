{ config, pkgs, ... }:

{
  home = {
      stateVersion = "24.05";

      packages = with pkgs; [
        just
        pueue
        universal-ctags
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
      escapeTime = 0;
      keyMode = "vi";
      shortcut = "g";
      shell = "\${pkgs.zsh}/bin/zsh";
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
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        "!!" = "fc -ln -1";
      };
    };
    eza.enable = true;
    starship.enable = true;
    git.enable = true;
    fzf.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    zoxide.enable = true;
    bat.enable = true;
  };
}
