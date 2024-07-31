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
        name = "link-configs";
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          inherit name;
          src = ./.;
          builder = builtins.toFile "builder.sh" ''
            mkdir -p "$out"
            cp -R "$src"/* "$out/"

            bin="$out/bin/${name}"
            cat <<EOF > "$bin"
            #!/bin/sh

            cd "$out"
            find -type f | while read f; do
              install -D "\$f" "\$HOME/.config/\$f"
            done
            chmod +x "$bin"
          '';
        };
      }
    );
}
