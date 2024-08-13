{
  description = "Home Manager configuration";

  inputs = {
    # use global registry for nixpkgs
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, flake-utils, home-manager, ... }:
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
      })];
    in
      flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs { inherit system overlays; };
          files = builtins.readDir ./.;
        in {
          packages.homeConfigurations."bob" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = with builtins; map (path: ./. + "/${path}") (filter (name: (getAttr name files) == "regular" &&  match "^.*\.nix$" name != null &&  match "^flake\.nix$" name == null) (attrNames files));
          };
        }
      );
}
