# nixosModules/gui.nix: Graphical modules

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    keepassxc
    kitty
  ];
}
