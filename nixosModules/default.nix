# default.nix
{ config, ... }:

{
  imports = [
    ./general.nix
    ./system.nix
  ];
}
