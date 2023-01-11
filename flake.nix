{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils"; 
  };
  outputs = { self, nixpkgs, flake-utils }: {
    make = pkgsFn:
      flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in {
          devShell = pkgs.mkShell {
            buildInputs = pkgsFn pkgs;
          };
        }
      );
  };
}
