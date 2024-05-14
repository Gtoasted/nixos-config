# machines/laptop.nix: configurations common to all laptops

{ ... }:

{
  # Enable wireless networking
  networking.wireless.enable = true;
}
