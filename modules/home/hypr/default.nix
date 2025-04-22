{
  config,
  lib,
  extraLib,
  ...
}:
{
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./hyprshot.nix
    ./dunst.nix
    ../waybar
    ../rofi
  ];

  #imports = (extraLib.getAllChildren ./.);

  options.gtoasted.hypr = {
    enable = lib.mkEnableOption "Enable the Hypr Ecosystem and some additional modules";
  };

  config = lib.mkIf config.gtoasted.hypr.enable {
    gtoasted = {
      hyprland.enable = lib.mkDefault true;
      hyprlock.enable = lib.mkDefault true;
      hypridle.enable = lib.mkDefault true;
      hyprshot.enable = lib.mkDefault true;
      dunst.enable = lib.mkDefault true;
      waybar.enable = lib.mkDefault true;
      rofi.enable = lib.mkDefault true;
    };
  };
}
