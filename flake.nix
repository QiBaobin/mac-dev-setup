{
  description = "Setup home";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem(system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "switchHome";
          src = ./.;
          phases = [ "buildPhase" ];
          buildPhase = ''
            mkdir -p "$out/bin"
            cp -R "$src/home-manager"  "$src/configs" "$out/"

            bin="$out/bin/switchHome"
            printf '%s\n\n%s\n'  '#!/bin/sh' 'out="'$out'"' > "$bin"
            cat "$src/switchHome.sh" >> "$bin"
            chmod +x "$bin"
          '';
        };
      }
    );
}
