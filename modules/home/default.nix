{ inputs, ... }: {
  imports = [
		inputs.nixvim.homeManagerModules.nixvim
		inputs.sops-nix.homeManagerModules.sops
		./hypr
		./nixvim
		./firefox.nix
		./git.nix
		./gtk.nix
		./java.nix
    ./librewolf.nix
		./notex.nix
		./other.nix
		./qt.nix
		./sops.nix
		./ssh.nix
    ./stylix.nix
		./syncthing.nix
  ];

  nixpkgs.config = {
    allowUnfreePredicate = _: true;
		allowUnfree = true;
  };

  programs.home-manager.enable = true;
}
