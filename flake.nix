{
  description = "Setup home";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, home-configs, ... }:
    flake-utils.lib.eachDefaultSystem(system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "switchHome";
          src = ./home-manager;
          buildInputs = [ home-manager.packages.${system}.default home-configs.packages.${system}.default ];
          phases = [ "buildPhase" ];
          buildPhase = let
            script = builtins.toFile "script" ''
              dir=$(mktemp -d "''${TMPDIR:-/tmp}"/XXXXXXX)
              dir=$(realpath $dir)
              for f in "$out/home-manager"/*; do
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

              home-manager -- switch --flake "$dir/#bob" -b backup || exit 1
              rm -rf "$dir"

              cd "$HOME/.nix-profile/config" || exit 2
              find . -type l | while read f; do
                install -D "$f" "$HOME/.config/"
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
