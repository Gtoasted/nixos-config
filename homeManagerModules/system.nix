# homeManagerModules/system.nix: Home Manager packages relevant for the system config

{ pkgs, lib, config, ... }: {
  programs.git = {
    enable = true;
    userName = "Gtoasted";
    userEmail = "arne@vonlaguna.de";
    extraConfig.safe.directory = "/etc/nixos";
  };
}
