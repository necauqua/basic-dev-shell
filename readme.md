# basic-dev-shell
This is a _basic dev shell_ which allows one to have a set of packages
installed in a project directory on NixOS with a help from direnv.

It's just a shortcut to have less lines in your `flake.nix` file in case a
basic dev shell is all that you need.

And example of a dev shell that adds `jdk17` to your folder:
```nix
{
  description = "Just a devShell with a JVM, to use on NixOS with direnv";
  inputs.basic-dev-shell.url = "github:necauqua/basic-dev-shell";
  outputs = { self, basic-dev-shell }: basic-dev-shell.make (pkgs: [pkgs.jdk17]);
}
```
