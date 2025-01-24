{
  outputs = { self, nixpkgs, flake-utils }: {
    make = fn:
      flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = nixpkgs.legacyPackages."${system}";
          arg = fn pkgs;
        in {
          devShell = (pkgs.mkShell (
            if (builtins.typeOf arg) == "list" then
              {
                buildInputs = arg;
              }
            else arg
          ));
        }
      );
  };
}
