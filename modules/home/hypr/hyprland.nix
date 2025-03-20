{ config, lib, pkgs, ... }: {
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
      default = lib.getExe pkgs.librewolf;
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

	config = let
    cfg = config.gtoasted.hyprland;
  in lib.mkIf cfg.enable {
		home.packages = with pkgs; [
			xdg-desktop-portal-hyprland
			cliphist
		];

    home.sessionVariables = {
      HYPRCURSOR_SIZE = config.stylix.cursor.size;
    };

		wayland.windowManager.hyprland = {
			enable = true;
			package = pkgs.hyprland;
			xwayland.enable = true;
			systemd.enable = true;
			settings = {
        exec-once = lib.concatStringsSep "&" cfg.autostart;

        debug = {
          disable_logs = false;
          disable_time = false;
        };

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
			};
			
			extraConfig = ''
				source = ~/.config/hypr/monitors.conf
				source = ~/.config/hypr/workspaces.conf
			'';
		};
	};
}

