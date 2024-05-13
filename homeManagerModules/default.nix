# default.nix: default modules

{ ... }:

{
  imports = [
    ./system.nix
    ./cli.nix
    ./gui.nix
  ];
}
