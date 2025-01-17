{
  description = "Example project using P2PRC";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    hsp2prc.url = "github:xecarlox94/p2p-rendering-computation?ref=nix-flake&dir=Bindings/Haskell";
  };

  outputs = { self, nixpkgs, hsp2prc }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; }; # Adjust for your system
    in {
      packages.default = pkgs.haskellPackages.ghcWithPackages (haskellPkgs: [
        hsp2prc.packages.${pkgs.system}.default
      ]);

      devShell.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          cabal-install
          haskell.compiler.ghc96
          zlib.dev
          p2prc.outputs.packages.${system}.default
        ];
      };

    };
}

