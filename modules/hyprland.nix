{ config, lib, ... }:
{
  options.gtoasted.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland.";
  };

  config = lib.mkIf config.gtoasted.hyprland.enable {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
  };
}
