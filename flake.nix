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
          src = ./home-manager;
          phases = [ "buildPhase" ];
          buildPhase = let
            script = builtins.toFile "script" ''
              dir=$(mktemp -d "''${TMPDIR:-/tmp}"/XXXXXXX)
              dir=$(realpath $dir)
              for f in "$out"/*; do
                install "$f" "$dir"
              done

              cat <<EOF > "$dir/user.nix"
              { ... }:
              {
                home.username = "$USER";
                home.homeDirectory = "$HOME";
                programs.alacritty.settings.import = [ "$HOME/.config/alacritty/local.toml" ];
              }
              EOF
              cat <<EOF > "$dir/proxy.nix"
              { ... }:
              {
                programs.zsh.sessionVariables.no_proxy = "$no_proxy";
                programs.zsh.sessionVariables.http_proxy = "$http_proxy";
                programs.zsh.sessionVariables.https_proxy = "$https_proxy";
              }
              EOF

              rm "$HOME/.config/kak/kakrc"
              nix run home-manager/master -- switch --flake "$dir/#bob" -b backup || exit 1
              rm -rf "$dir"

              cd "$HOME/.nix-profile/config" || exit 2
              find . -type l -or -type f | while read f; do
                mkdir -p "$HOME/.config/$(dirname "$f")"
                ln -sf "$HOME/.nix-profile/config/$f" "$HOME/.config/$f"
              done
            '';
          in ''
            mkdir -p "$out/bin"
            cp -R "$src"/* "$out/"

            bin="$out/bin/switchHome"
            {
              echo "#!/bin/sh"
              echo
              echo 'out="'$out'"'
              cat "${script}"
            } >> "$bin"
            chmod +x "$bin"
          '';
        };
      }
    );
}
