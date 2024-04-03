{ config, ... }:

{
  imports = [
    ./wget.nix
    ./sops.nix
    ./newModule/newModule.nix
  ];

  wget.enable = true;
  sops.enable = true;
  newModule.enable = true;
}
