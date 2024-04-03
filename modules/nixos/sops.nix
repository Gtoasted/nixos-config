# sops.nix

{ pkgs, lib, config, ... }: {
  options = {
    sops.enable = lib.mkEnableOption "Enables sops";
  };

  config = lib.mkIf config.wget.enable {
    environment.systemPackages = with pkgs; [
      sops
    ];
  };
}
