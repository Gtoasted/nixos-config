{ pkgs, ... }: {
  home-manager.users."arne" = let
      sharedModules = builtins.fromJSON (builtins.readFile ../dotfiles/waybar/shared-modules.json);
    in {
      home.file = {
      ".config/waybar/colors.css".source = ../dotfiles/waybar/colors.css;
      ".config/waybar/style.css".source = ../dotfiles/waybar/style.css;
      ".config/waybar/scripts".source = ../dotfiles/waybar/scripts;
      ".config/waybar/shared-modules.json".source = ../dotfiles/waybar/shared-modules.json;
    };

    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
      settings = {
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
  };
}
