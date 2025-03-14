{ config, lib, ...}: {
  config =
    let
      cfg = config.gtoasted.hyprland;
    in
      lib.mkIf cfg.enable {
        wayland.windowManager.hyprland.settings = let
          mainMod = "SUPER";
        in {
          "$mainMod" = mainMod;
          bind = let
            moveBinds = {
              l = "h";
              d = "j";
              u = "k";
              r = "l";
            };
            workspaceBinds = builtins.listToAttrs
              (builtins.map (x: {
                name = toString x;
                value = toString x;
              }) [
              1 2 3 4 5 6 7 8 9
            ]) // { "10" = "0"; };
          in [
            # New binds
            # Application Shortcuts
            "${mainMod}, space, exec, ${cfg.terminal}"
            "${mainMod}, b, exec, ${cfg.browser}"
            "${mainMod}, e, exec, ${cfg.fileManager}"
            "${mainMod}, r, exec, ${cfg.launcher}"

            # Window Management
            "${mainMod}, c, killactive, "
            "${mainMod}, v, togglefloating, "
            "${mainMod}, p, pseudo, "
            "${mainMod}, w, togglesplit, "
            "${mainMod}, f, fullscreen, "

            # Groups
            "${mainMod}, t, togglegroup"
            "${mainMod}, tab, changegroupactive, f"
            "${mainMod} shift, tab, changegroupactive, b"
            "${mainMod}, d, movegroupwindow"
            "${mainMod}, a, movegroupwindow, b"

            # Media Buttons
            ", XF86AudioMute, exec, amixer sset 'Master' togglemute # F1"
            ", XF86AudioLowerVolume, exec, amixer sset 'Master' 5%- # F2"
            ", XF86AudioRaiseVolume, exec, amixer sset 'Master' 5%+ # F3"
            ", XF86MonBrightnessDown, exec, brightnessctl set 5%- # F4"
            ", XF86MonBrightnessUp, exec, brightnessctl set +5% # F5"
            ", XF86PowerOff, exec, systemctl suspend"

            # Other
            ", print, exec, hyprshot -m region"
            "${mainMod} control_l shift, l, exec, loginctl lock-session"
            "${mainMod}, M, exec, pkill .nwg-displays-w || nwg-displays"
            # "SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
          ]
            ++ lib.mapAttrsToList (direction: key: "${mainMod}, ${key}, movefocus, ${direction}") moveBinds
            ++ lib.mapAttrsToList (direction: key: "${mainMod} shift, ${key}, movewindow, ${direction}") moveBinds
            ++ lib.mapAttrsToList (direction: key: "${mainMod} control_l, ${key}, movewindow, ${direction}") moveBinds
            ++ lib.mapAttrsToList (workspace: key: "${mainMod}, ${key}, workspace, ${workspace}") workspaceBinds
            ++ lib.mapAttrsToList (workspace: key: "${mainMod} shift, ${key}, movetoworkspace, ${workspace}") workspaceBinds
            ;

          bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, surface:3, movewindow"
            "$mainMod, mouse:273, resizewindow"
          ];
        };
  };
}
