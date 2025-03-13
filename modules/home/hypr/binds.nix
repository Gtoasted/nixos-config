{ config, lib, ...}: {
  config =
    let
      cfg = config.gtoasted.hyprland;
    in
      lib.mkIf cfg.enable {
        wayland.windowManager.hyprland.settings = {
          "$mainMod" = "SUPER";
          bind = [
            "$mainMod, C, killactive, "
            "$mainMod, V, togglefloating, "
            "$mainMod, P, pseudo,"
            "$mainMod, Ö, togglesplit,"

            "$mainMod, Q, exec, ${cfg.terminal}"
            "$mainMod, E, exec, ${cfg.fileManager}"
            "$mainMod, R, exec, $menu"
            "$mainMod, B, exec, ${cfg.browser}"
            "$mainMod, F, fullscreen"

            "$mainMod, h, movefocus, l"
            "$mainMod, l, movefocus, r"
            "$mainMod, k, movefocus, u"
            "$mainMod, j, movefocus, d"

            "$mainMod SHIFT, h, movewindow, l"
            "$mainMod SHIFT, l, movewindow, r"
            "$mainMod SHIFT, k, movewindow, u"
            "$mainMod SHIFT, j, movewindow, d "

            "$mainMod Control_L, h, movewindoworgroup, l"
            "$mainMod Control_L, l, movewindoworgroup, r"
            "$mainMod Control_L, k, movewindoworgroup, u"
            "$mainMod Control_l, j, movewindoworgroup, d "

            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"

            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
            "$mainMod SHIFT, 6, movetoworkspace, 6"
            "$mainMod SHIFT, 7, movetoworkspace, 7"
            "$mainMod SHIFT, 8, movetoworkspace, 8"
            "$mainMod SHIFT, 9, movetoworkspace, 9"
            "$mainMod SHIFT, 0, movetoworkspace, 10"

            "$mainMod, S, togglespecialworkspace, magic"
            "$mainMod SHIFT, S, movetoworkspace, special:magic"

            "$mainMod, mouse_down, workspace, e+1"
            "$mainMod, mouse_up, workspace, e-1"

            "$mainMod, T, togglegroup"
            "$mainMod, TAB, changegroupactive, f"
            "$mainMod Shift, TAB, changegroupactive, b"
            "$mainMod , d, movegroupwindow"
            "$mainMod , a, movegroupwindow, b"

            ", XF86AudioMute, exec, amixer sset 'Master' togglemute # F1"
            ", XF86AudioLowerVolume, exec, amixer sset 'Master' 5%- # F2"
            ", XF86AudioRaiseVolume, exec, amixer sset 'Master' 5%+ # F3"
            ", XF86MonBrightnessDown, exec, brightnessctl set 5%- # F4"
            ", XF86MonBrightnessUp, exec, brightnessctl set +5% # F5"

            ", Print, exec, hyprshot -m region"

            ", XF86PowerOff, exec, systemctl suspend"
            "$mainMod Control_L SHIFT, L, exec, loginctl lock-session"
            "$mainMod, M, exec, pkill .nwg-displays-w || nwg-displays"
            # "SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
          ];

          bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, surface:3, movewindow"
            "$mainMod, mouse:273, resizewindow"
          ];
        };
  };
}
