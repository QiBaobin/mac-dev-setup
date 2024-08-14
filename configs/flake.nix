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
              rev = "a250b96c18659d34d50e13de8d5126ca7fed6814";
              sha256 = "sha256-j3WCa2+47dX6zkuTjU6Nv4wqZHbw0V6vJ+2ZD517Q5Y=";
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
