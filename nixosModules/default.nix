# nixosModules/default.nix: Default nixos modules
{ config, ... }:

{
  imports = [
    ./system.nix
    ./gui.nix
  ];
}
