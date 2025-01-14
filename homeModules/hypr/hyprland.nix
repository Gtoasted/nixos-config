{ config, lib, pkgs, ... }: {
	options.gtoasted.hyprland = {
		enable = lib.mkEnableOption "Enable Hyprland, the windows manager.";
	};

	config = lib.mkIf config.gtoasted.hyprland.enable {
		home.packages = with pkgs; [
			xdg-desktop-portal-hyprland
			cliphist
		];

		wayland.windowManager.hyprland = {
			enable = true;
			package = pkgs.hyprland;
			xwayland.enable = true;
			systemd.enable = true;
			settings = {
				exec-once = "waybar & hypridle & syncthing";
				"$terminal" = "kitty";
				"$fileManager" = "dolphin";
				"$menu" = "rofi -show drun";

				env = [
					"XCURSOR_SIZE,24"
					"QT_QPA_PLATFORMTHEME,qt5ct"
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
					# "col.active_border" = "rgba(522258ff)";
					# "col.inactive_border" = "rgba(8C30612e)";
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

						shadow = {
							enabled = true;
							range = 4;
							render_power = 3;
							# color = "rgba(1a1a1aee)";
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
					# "col.border_active" = "rgba(522258ff)";
					# "col.border_inactive" = "rgba(8C30612e)";

					groupbar = {
						height = 20;
						# "col.active" = "rgba(522258ff)";
						# "col.inactive" = "rgba(8C3061c0)";
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
					"$mainMod, Ö, togglesplit,"

					"$mainMod, Q, exec, $terminal"
					"$mainMod, E, exec, $fileManager"
					"$mainMod, R, exec, $menu"
					"$mainMod, B, exec, firefox"
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
			
			extraConfig = ''
				source = ~/.config/hypr/monitors.conf
				source = ~/.config/hypr/workspaces.conf
			'';
		};
	};
}

