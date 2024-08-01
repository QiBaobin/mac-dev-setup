{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-configs = {
      url = "github:QiBaobin/mac-dev-setup?dir=configs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, flake-utils, home-manager,home-configs, ... }:
    let
      overlays  = [(self: super: {
        kakoune-unwrapped = super.kakoune-unwrapped.overrideAttrs(old: {
          version = "master";
          src = super.fetchFromGitHub {
              owner = "mawww";
              repo = "kakoune";
              rev = "10ed78fe8a580b3558348746ee53f81c5b0aeae1";
              sha256 = "sha256-FHhgi+7yRTQve1sfACgdR1YGLaZaGGT8CeHNo+FNaaU=";
          };
        });
        configs = home-configs.packages.default;
      })];
    in
      flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs { inherit system overlays; };
        in {
          packages.homeConfigurations."bob" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = with builtins; filter (name: baseNameOf name == ".nix") (attrNames  (readDir ./.));
          };
        }
      );
}
