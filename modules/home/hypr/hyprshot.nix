{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.gtoasted.hyprshot = {
    enable = lib.mkEnableOption "Enable Hyprshot.";
  };

  config = lib.mkIf config.gtoasted.hyprshot.enable {
    home.packages = with pkgs; [
      hyprshot
    ];

    home.sessionVariables = {
      HYPRSHOT_DIR = "Pictures/Screenshots";
    };
  };
}
