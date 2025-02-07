{ config, lib, pkgs, ... }: {
	# TODO: Split into multiple modules
	options.gtoasted.other = {
		enable = lib.mkEnableOption "Enable a bunch of modules.";
	};

	config = lib.mkIf config.gtoasted.other.enable {
		home.packages = with pkgs; [
			# Media
			inkscape
			gimp
      spotify
			# Documents
			libreoffice-qt
			texliveFull
			xournalpp
			pdfpc
			obsidian
			# Spelling
			hunspell
			hunspellDicts.de_DE
			hunspellDicts.en_US
			# Tools
			nwg-displays
			pavucontrol
			wpa_supplicant_gui 
			wl-clipboard
			zip
			unzip
			# Communication
			discord
			element-desktop
			signal-desktop
			thunderbird
			# Misc
			kitty
			dolphin
			jetbrains-toolbox
			prismlauncher
		];

		programs.bash.enable = true;

		programs.starship = {
			enable = true;
			enableBashIntegration = true;
		};

		programs.zathura = {
			enable = true;
			options = {
				window-title-basename = true;
			};
		};
		stylix.targets.zathura.enable = false;

		xdg = {
			desktopEntries.zathura = {
				name = "Zathura";
				exec = "${pkgs.zathura}/bin/zathura";
			};
			mimeApps = {
				enable = true;
				defaultApplications = {
					"application/pdf" = "zathura.desktop";
				};
			};
		};
	};
}
