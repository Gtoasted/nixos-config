{ ... }: {
  imports = [
    ./neovim
    ./git.nix

    ./firefox.nix

    ./notex.nix

    ./other.nix
  ];

  nixpkgs = {
    config.allowUnfreePredicate = _: true;
    overlays = [
      ( import ../overlays.nix { } ).additions
    ];
  };

  programs.home-manager.enable = true;
}
