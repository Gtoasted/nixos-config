{ pkgs, ... } : let
  sharedModules = builtins.fromJSON (builtins.readFile ../dotfiles/waybar/shared-modules.json);
in {
  home.file = {
    ".config/waybar/colors.css".source = ../dotfiles/waybar/colors.css;
    ".config/waybar/style.css".source = ../dotfiles/waybar/style.css;
    ".config/waybar/scripts".source = ../dotfiles/waybar/scripts;
    ".config/waybar/shared-modules.json".source = ../dotfiles/waybar/shared-modules.json;
#    ".config/waybar/config".source = ../dotfiles/waybar/config;
  };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        output = "eDP-1";
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [
          "clock"
          "hyprland/workspaces"
          "memory"
          "cpu"
          "network"
          "bluetooth"
        ];
        modules-right = [
          "hyprland/submap"
          "custom/wlinhibit"
          "battery"
          "backlight"
          "custom/mako"
          "wireplumber"
          "user"
        ];
      }

      // sharedModules;

      fallback = {
          layer = "top";
          output = "!eDP-1";
          position = "top";
          height = 32;
          modules-left = [
            "clock"
          ];
          modules-right = [
            "hyprland/submap"
            "custom/wlinhibit"
            "battery#standalone"
          ];
      }
      // sharedModules;
    };
  };

}
