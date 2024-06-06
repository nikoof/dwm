{
  description = "Personal dwm config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }@inputs:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        defaultPackage = pkgs.dwm.overrideAttrs (oa: {
          src = ./.;
        });
      }
    );
}
