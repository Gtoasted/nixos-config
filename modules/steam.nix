{ config, lib, ... }:
{
  options.gtoasted.steam = {
    enable = lib.mkEnableOption "Enable steam.";
  };

  config = lib.mkIf config.gtoasted.steam.enable {
    programs.steam.enable = true;
  };
}
