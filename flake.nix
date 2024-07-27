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

        sed -e "s#myUser#$USER#" -e "s#mySystem#${system}#" -e "s#myHome#$HOME#" home-manager/template.nix > home-manager/flake.nix
        git add --intent-to-add home-manager/flake.nix
        nix run home-manager/master -- switch --flake ./home-manager -b backup
        '';
        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/swithHome";
        };
      }
    );
}
