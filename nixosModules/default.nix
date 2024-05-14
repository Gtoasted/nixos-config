# nixosModules/default.nix: Default nixos modules
{ config, ... }:

{
  imports = [
    ./general.nix
    ./system.nix
  ];
}
