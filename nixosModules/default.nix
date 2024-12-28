{ ... }: {
  imports = [
    ./system.nix
  ];

  users.users.arne = {
    isNormalUser = true;
    description = "Arne von Laguna";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Do not change
  system.stateVersion = "23.11";
}
