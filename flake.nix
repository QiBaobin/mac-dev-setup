{
  description = "Setup home";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # use registry instead
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem(system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "switchHome";
          src = ./configs;
          phases = [ "buildPhase" ];
          buildPhase = ''
            mkdir -p "$out/bin"
            cp -Rv "$src"/* "$out/"

            bin="$out/bin/switchHome"
            cat <<BIN_DONE > "$bin"
            #!/bin/sh

            dir=\$(mktemp -d "\''${TMPDIR:-/tmp}"/XXXXXXX)
            cd "$out"
            find . -type f | while read f; do
              [[ \$f == *"bin/"* ]] || "${pkgs.coreutils}/bin/install" -D "\$f" "\$dir/\$f"
            done

            cd "\$dir"
            cat <<EOF > "user.nix"
            { ... }:
            {
              home.username = "\$USER";
              home.homeDirectory = "\$HOME";
            }
            EOF
            cat <<EOF > "env.nix"
            { ... }:
            {
              home.sessionVariables = {
                \$(env | grep -i 'proxy\|api_key' | sed -e 's/=\(.*\)/ = "\1";/')
              };
            }
            EOF
            cat <<EOF > "config.nix"
            { ... }:
            {
              xdg.configFile = with builtins; listToAttrs (map (name: { name = name; value = { text = readFile (./. + "/\\\''${name}"); }; }) [
                \$(find . -type f -not -name '*.nix' -not -name '*.lock' | sed -E 's#./(.*)#"\1"#')
              ]);
            }
            EOF

            nix run home-manager/master -- switch --flake ".#bob" -b backup || exit 1
            cd && rm -rf "\$dir"
            BIN_DONE

            chmod +x "$bin"
          '';
        };
      }
    );
}
