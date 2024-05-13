# general.nix

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    keepassxc
    vim
    kitty
  ];
}
