{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./binds.nix
  ];

  options.gtoasted.hyprland = with lib; {
    enable = mkEnableOption "Enable Hyprland, the windows manager.";
    autostart = mkOption {
      default = [ ];
      example = [ "syncthing" ];
      type = types.listOf types.str;
      description = ''
        List of commands to be automatically executed on startup.
      '';
    };
    terminal = mkOption {
      type = types.str;
      default = lib.getExe pkgs.kitty;
      description = "The terminal to use.";
    };
    browser = mkOption {
      type = types.str;
      default = lib.getExe pkgs.firefox;
      description = "The browser to use.";
    };
    fileManager = mkOption {
      type = types.str;
      default = lib.getExe' pkgs.kdePackages.dolphin "dolphin";
      description = "The file manager to use.";
    };
    launcher = mkOption {
      type = types.str;
      default = "rofi -show drun";
      description = "The launcher to use.";
    };
  };

  config =
    let
      cfg = config.gtoasted.hyprland;
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [
        cliphist
        iio-hyprland
        jq
      ];

      home.sessionVariables = {
        HYPRCURSOR_SIZE = config.stylix.cursor.size;
      };

      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        systemd.enable = true;
        plugins = [
          pkgs.hyprlandPlugins.hyprgrass
        ];

        settings = {
          # style
          general = {
            gaps_in = 2;
            gaps_out = 5;
            border_size = 1;
            layout = "dwindle";
            allow_tearing = "false";
          };

          dwindle = {
            pseudotile = "yes";
            preserve_split = "yes";
          };

          master = {
            new_status = "master";
          };

          decoration = {
            rounding = 2;

            blur = {
              enabled = true;
              size = 3;
              passes = 1;
            };

            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
            };
          };

          animations = {
            enabled = "yes";
            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
            animation = [
              "windows, 1, 7, myBezier"
              "windowsOut, 1, 7, default, popin 80%"
              "border, 1, 10, default"
              "borderangle, 1, 8, default"
              "fade, 1, 7, default"
              "workspaces, 1, 6, default"
            ];
          };

          windowrulev2 = [
            "suppressevent maximize, class:.*"
            "float, class:(nwg-displays)"
            "float, initialTitle:(rofi - drun)"
          ];

          group.groupbar.height = 20;
          misc.force_default_wallpaper = -1;

          # input
          plugin.touch_gestures = {
            sensitivity = 4.0;
            workspace_swipe_fingers = 4;
            workspace_swipe_edge = "d";
            long_press_delay = 400; # ms
          };

          device = {
            name = "epic-mouse-v1";
            sensitivity = -0.5;
          };

          input = {
            kb_layout = "de";
            kb_variant = "nodeadkeys";
            follow_mouse = 1;
            sensitivity = 0;
            touchpad = {
              natural_scroll = true;
              # Needs to be false if iio-hyprland is installed, or it will randomly block the touchpad.
              disable_while_typing = false;
            };
          };

          gestures = {
            workspace_swipe = true;
            workspace_swipe_fingers = 4;
            workspace_swipe_cancel_ratio = 0.1;
          };

          debug = {
            disable_logs = false;
            disable_time = false;
          };

          exec-once = lib.concatStringsSep "&" (cfg.autostart ++ [ "iio-hyprland" ]);
        };

        # Required for nwg-displays
        extraConfig = ''
          				source = ~/.config/hypr/monitors.conf
          				source = ~/.config/hypr/workspaces.conf
          			'';
      };
    };
}
