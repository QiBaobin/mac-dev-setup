{
  description = "Setup home";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages.default = pkgs.writeScriptBin "swithHome" ''
        #!/bin/sh

        echo '{ ... }:  { home = { username = "'$USER'"; homeDirectory = "'$HOME'"; }; }' > home-manager/user.nix
        echo '{ ... }:  { programs.zsh.sessionVariables.no_proxy = "'$no_proxy'"; programs.zsh.sessionVariables.http_proxy = "'$http_proxy'"; programs.zsh.sessionVariables.https_proxy = "'$https_proxy'"; }' > home-manager/proxy.nix
        nix run home-manager/master -- switch --flake ./home-manager#bob -b backup
        echo > home-manager/user.nix
        echo > home-manager/proxy.nix

        cp -v configs/kak/kakrc $HOME/.config/kak/realrc
        cp -Rv configs/skhd $HOME/.config/
        '';
        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/swithHome";
        };
      }
    );
}
