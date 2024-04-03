{ config, ... }:

{
  imports = [
    ./wget.nix
    ./sops.nix
    ./newModule/newModule.nix
    ./keepassxc.nix
  ];

  wget.enable = true;
  sops.enable = true;
  newModule.enable = true;
  keepassxc.enable = true;
}
