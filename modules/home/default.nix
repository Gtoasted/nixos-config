{ inputs, ... }: {
  imports = [
		inputs.nixvim.homeManagerModules.nixvim
		inputs.sops-nix.homeManagerModules.sops
		./hypr
		./nixvim
		./firefox.nix
		./git.nix
		./java.nix
    ./librewolf.nix
		./notex.nix
		./other.nix
		./qt.nix
    ./rice.nix
		./sops.nix
		./ssh.nix
		./syncthing.nix
  ];

  nixpkgs.config = {
    allowUnfreePredicate = _: true;
		allowUnfree = true;
  };

  programs.home-manager.enable = true;
}
