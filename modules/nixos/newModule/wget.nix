# wget.nix

{ pkgs, lib, config, ... }: {
  options = {
    wget.enable = lib.mkEnableOption "Enables wget";
  };

  config = lib.mkIf config.wget.enable {
    environment.systemPackages = with pkgs; [
      wget
    ];
  };
}
