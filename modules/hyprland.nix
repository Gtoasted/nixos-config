{ inputs, pkgs, lib, ... }: {
  imports = [
    ./waybar.nix
  ];

  environment.systemPackages = with pkgs; [
    hypridle
    hyprlock
    xdg-desktop-portal-hyprland
    cliphist
    wlinhibit
  ];


  home-manager.users."arne" = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      xwayland.enable = true;
      systemd.enable = true;
      settings = {
        exec-once = "waybar & hyprlock & hypridle";
        "$terminal" = "kitty";
        "$fileManager" = "dolphin";
        "$menu" = "rofi -show drun";

        env = [
          "XCURSOR_SIZE,24"
          "QT_QPA_PLATFORMTHEME,qt5ct"
        ];

        monitor = [
          "eDP-1,1920x1080@60,0x0,1"
          ",preferred,auto,1"
        ];

        input = {
            kb_layout = "de";
            kb_variant = "nodeadkeys";
            follow_mouse = 1;
            touchpad.natural_scroll = "yes";
            sensitivity = 0;
        };

        general = {
          gaps_in = 2;
          gaps_out = 5;
          border_size = 1;
          "col.active_border" = "rgba(522258ff)";
          "col.inactive_border" = "rgba(8C30612e)";
          layout = "dwindle";
          allow_tearing = "false";
        };

        decoration = {
            rounding = 2;
            
            blur = {
                enabled = true;
                size = 3;
                passes = 1;
            };

            drop_shadow = "yes";
            shadow_range = 4;
            shadow_render_power = 3;
            "col.shadow" = "rgba(1a1a1aee)";
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

        dwindle = {
            pseudotile = "yes";
            preserve_split = "yes";
        };

        master = {
            new_status = "master";
        };

        gestures = {
            workspace_swipe = true;
            workspace_swipe_fingers = 4;
        };
        
        group = {
          "col.border_active" = "rgba(522258ff)";
          "col.border_inactive" = "rgba(8C30612e)";

          groupbar = {
            height = 20;
            "col.active" = "rgba(522258ff)";
            "col.inactive" = "rgba(8C3061c0)";
          };
        };

        misc.force_default_wallpaper = -1;

        device = {
            name = "epic-mouse-v1";
            sensitivity = -0.5;
        };
        windowrulev2 = [
          "suppressevent maximize, class:.*"
          "float, class:(nwg-displays)"
          "float, initialTitle:(rofi - drun)"
        ];

        "$mainMod" = "SUPER";
        bind = [
          "$mainMod, C, killactive, "
          "$mainMod, V, togglefloating, "
          "$mainMod, P, pseudo,"
          "$mainMod, J, togglesplit,"

          "$mainMod, Q, exec, $terminal"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, R, exec, $menu"
          "$mainMod, F, exec, firefox"

          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          "$mainMod SHIFT, left, movewindow, l"
          "$mainMod SHIFT, right, movewindow, r"
          "$mainMod SHIFT, up, movewindow, u"
          "$mainMod SHIFT, down, movewindow, d "

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

          "$mainMod Control_L, left, movewindoworgroup, l"
          "$mainMod Control_L, right, movewindoworgroup, r"
          "$mainMod Control_L, up, movewindoworgroup, u"
          "$mainMod Control_l, down, movewindoworgroup, d "

          ", XF86AudioMute, exec, amixer sset 'Master' togglemute # F1"
          ", XF86AudioLowerVolume, exec, amixer sset 'Master' 5%- # F2"
          ", XF86AudioRaiseVolume, exec, amixer sset 'Master' 5%+ # F3"
          ", XF86MonBrightnessDown, exec, brightnessctl set 5%- # F4"
          ", XF86MonBrightnessUp, exec, brightnessctl set +5% # F5"

          ", Print, exec, hyprshot -m region"

          ", XF86PowerOff, exec, systemctl suspend"
          "$mainMod, L, exec, loginctl lock-session"
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

    programs.rofi.enable = true;

    services.mako = {
      enable = true;
      extraConfig = lib.fileContents ../config/mako/config;
    };

    home.file = {
      ".config/hypr/hyprlock.conf".source = ../config/hypr/hyprlock.conf;
      ".config/hypr/hypridle.conf".source = ../config/hypr/hypridle.conf;
      ".config/hypr/m87.png".source = ../config/hypr/m87.png;
      ".config/rofi".source = ../config/rofi;
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = "arne";
      };
    };
  };

  security.pam.services.hyprlock = {
    text = ''
      auth sufficient pam_fprintd.so
      auth include login
    '';
  };
}
