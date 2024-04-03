{ config, ... }:

{
  imports = [
    ./wget.nix
    ./sops.nix
  ];

  wget.enable = true;
  sops.enable = true;
}
