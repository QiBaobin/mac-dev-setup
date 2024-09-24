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
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, flake-utils, home-manager, neovim-nightly-overlay, ... }:
    let
      overlays  = [ neovim-nightly-overlay.overlays.default ];
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
