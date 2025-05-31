{ config, lib, pkgs, ... }:
{
  options.gtoasted.steam = {
    enable = lib.mkEnableOption "Enable steam.";
  };

  config = lib.mkIf config.gtoasted.steam.enable {
    programs.steam = {
      enable = true;
      protontricks.enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
