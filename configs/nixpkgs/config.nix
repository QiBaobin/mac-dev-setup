{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        direnv
        nix-direnv
        kakoune
        git
        fzf
        ripgrep
        fd
        tmux
        just
        pueue
        zoxide
        universal-ctags
      ];
      pathsToLink = [ "/share" "/bin" "/Applications/" ];
      extraOutputsToInstall = [ "man" "doc" ];
    };
  };
}
