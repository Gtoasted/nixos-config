# nixosModules/cli.nix: Command line modules

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}

