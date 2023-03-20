{
  outputs = { self, nixpkgs, flake-utils }: {
    make = pkgsFn:
      flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = nixpkgs.legacyPackages."${system}";
        in {
          devShell = pkgs.mkShell {
            buildInputs = pkgsFn pkgs;
          };
        }
      );
  };
}
