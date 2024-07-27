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
        nix run home-manager/master -- switch --flake ./home-manager#bob -b backup
        echo > home-manager/user.nix
        cp -v configs/kak/kakrc $HOME/.config/kak/realrc
        '';
        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/swithHome";
        };
      }
    );
}
