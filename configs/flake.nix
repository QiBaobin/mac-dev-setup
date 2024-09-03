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
              rev = "c1ce1d70146dd4b3cda76adc98bfac90da55d18c";
              sha256 = "sha256-BrS59vWXJggmr3Nq4ZZ/ngssnxxUgjUjQfdTxxR5eKo=";
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
