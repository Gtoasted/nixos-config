# system.nix: configuration that is neccessary for the system to function properly

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    sops
    git
    wget
  ];
}
