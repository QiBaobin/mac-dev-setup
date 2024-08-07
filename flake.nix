{
  description = "Setup home";

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
              "${pkgs.coreutils}/bin/install" -D "\$f" "\$dir/\$f"
            done

            cd "\$dir"
            cat <<EOF > "user.nix"
            { ... }:
            {
              home.username = "\$USER";
              home.homeDirectory = "\$HOME";
              programs.alacritty.settings.import = [ "\$HOME/.config/alacritty/local.toml" ];
            }
            EOF
            cat <<EOF > "proxy.nix"
            { ... }:
            {
              programs.zsh.sessionVariables.no_proxy = "\$no_proxy";
              programs.zsh.sessionVariables.http_proxy = "\$http_proxy";
              programs.zsh.sessionVariables.https_proxy = "\$https_proxy";
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
