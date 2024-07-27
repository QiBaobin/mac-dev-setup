{ config, pkgs, username, homeDirectory, ... }:

{
  home = {
      inherit username homeDirectory;
      stateVersion = "24.05";

      packages = with pkgs; [
        just
        pueue
        universal-ctags
      ];
  };

  programs = {
    home-manager.enable = true;
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    kakoune = {
      enable = true;
      defaultEditor = true;
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
    };
    git.enable = true;
    fzf.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    tmux.enable = true;
    zoxide.enable = true;
  };
}
