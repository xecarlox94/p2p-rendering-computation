{
  description = "P2PRC Haskell library";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    # p2prc.url = "../../";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      with pkgs;
      {
        packages.default = haskellPackages.callCabal2nix "p2prc" ./. {};

        devShells.default = mkShell {
            buildInputs = [
              cabal-install
            ];
          };
      }
    );
}

