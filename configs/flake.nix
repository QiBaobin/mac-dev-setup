{
  description = "Setup home configs";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem(system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "home-configs";
          src = ./.;
          phases = [ "buildPhase" ];
          buildPhase = ''
            mkdir -p "$out/config"
            cp -R "$src"/* "$out/"
          '';
        };
      }
    );
}
