{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        wezterm
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
