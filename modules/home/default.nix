{ inputs, ... }: {
  imports = [
		inputs.nixvim.homeManagerModules.nixvim
		inputs.sops-nix.homeManagerModules.sops
    ./ags
    ./communication.nix
    ./documents.nix
		./hypr
		./nixvim
		./notex
    ./fun.nix
		./git.nix
    ./jetbrains.nix
    ./librewolf.nix
    ./rice.nix
		./sops.nix
		./ssh.nix
		./syncthing.nix
    ./terminal.nix
    ./tools.nix
    ./zen.nix
  ];

  nixpkgs.config = {
    allowUnfreePredicate = _: true;
		allowUnfree = true;
  };

  programs.home-manager.enable = true;
}
