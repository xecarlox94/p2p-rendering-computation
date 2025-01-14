{
  description = "Nix flake for P2PRC Haskell library";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    p2prc.url = "../../";
  };

  outputs = { nixpkgs, p2prc, ... }:
    let

    allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

    forAllSystems = function:
      nixpkgs.lib.genAttrs allSystems
        (system: function
          {
            pkgs=nixpkgs.legacyPackages.${system};
            inherit system;
          }
        );

    in
    {
    packages = forAllSystems ({pkgs, system}:
      {
        default = pkgs.cowsay;
        p2prc=p2prc.outputs.packages.${system}.default;
      });

    devShells = forAllSystems ({pkgs, system}:
      {
        default = pkgs.mkShell {
          buildInputs = [p2prc.outputs.packages.${system}.default];
        };
      });

    };
}
