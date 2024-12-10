{ pkgs, ... }: {
  home.packages = with pkgs; [
    wlinhibit
    alsa-utils
    killall
  ];

  home.file = {
    ".config/waybar/colors.css".source = ./config/colors.css;
    ".config/waybar/style.css".source = ./config/style.css;
    ".config/waybar/scripts".source = ./config/scripts;
    ".config/waybar/shared-modules.json".source = ./config/shared-modules.json;
  };

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = let
      sharedModules = builtins.fromJSON (builtins.readFile ./config/shared-modules.json);
    in {
      mainBar = {
        output = "eDP-1";
        layer = "top";
        position = "bottom";
        height = 32;
        modules-left = [
          "hyprland/workspaces"
          "backlight"
          # "memory"
          # "cpu"
          "network"
          "bluetooth"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "hyprland/submap"
          "custom/wlinhibit"
          "custom/mako"
          "wireplumber"
          "battery#standalone"
          "clock"
          "user"
        ];
      }

      // sharedModules;

      fallback = {
        layer = "top";
        output = "!eDP-1";
        position = "bottom";
        height = 32;
        modules-left = [
          "clock"
        ];
        modules-right = [
          "hyprland/submap"
          "custom/wlinhibit"
          "battery#standalone"
          "clock"
        ];
      }

      // sharedModules;
    };
  };
}