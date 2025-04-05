{ inputs, ... }: {
  imports = [
		inputs.nixvim.homeManagerModules.nixvim
		inputs.sops-nix.homeManagerModules.sops
    ./ags
    ./communication.nix
    ./documents.nix
    ./firefox.nix
		./hypr
		./nixvim
		./notex
    ./fun.nix
		./git.nix
    ./jetbrains.nix
    ./librewolf.nix
    ./mullvad-browser.nix
    ./rice.nix
    ./settings.nix
		./sops.nix
		./ssh.nix
		./syncthing.nix
    ./terminal.nix
    ./tools.nix
  ];

  nixpkgs.config = {
    allowUnfreePredicate = _: true;
		allowUnfree = true;
  };

  programs.home-manager.enable = true;
}
