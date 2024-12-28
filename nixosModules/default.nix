{ ... }: {
  imports = [
    ./system.nix
    ./users.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    ( import ../overlays.nix { } ).additions
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Do not change
  system.stateVersion = "23.11";
}
