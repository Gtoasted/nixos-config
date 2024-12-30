{ inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
		inputs.sops-nix.nixosModules.sops
		inputs.stylix.nixosModules.stylix
    ./system.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    ( import ../overlays.nix { } ).additions
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
