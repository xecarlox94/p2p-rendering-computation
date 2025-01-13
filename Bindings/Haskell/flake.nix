{
  description = "Nix flake for P2PRC Haskell library";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # p2prc.url = "../../";
  };

  outputs = { self, nixpkgs, p2prc }:
    let

    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

    forAllSystems = function:
      nixpkgs.lib.genAttrs allSystems
        (system: function {
            pkgs = import nixpkgs { inherit system; };
            system = system;
          }
        );

    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    in
    {
    packages.${system}.default = derivation {
        name = "simple";
        # with `with`, we can just do `bash`
        builder = with pkgs; "${bash}/bin/bash";
        args = [ "-c" "echo foo > $out" ];
        src = ./.;
        system = system;
      };
    };
}
