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

        cat <<EOF > home-manager/flake.nix
{ ... }:

{
  home = {
      username = "$USER";
      homeDirectory = "$HOME";
  };
}
EOF
        nix run home-manager/master -- switch --flake ./home-manager#bob -b backup
        cp -v configs/kak/kakrc $HOME/.config/kak/realrc
        '';
        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/swithHome";
        };
      }
    );
}
