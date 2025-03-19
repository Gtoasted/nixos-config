{ config, lib, pkgs, jetbrains-plugins, ... }: {
	# TODO: Split into multiple modules
	options.gtoasted.other = {
		enable = lib.mkEnableOption "Enable a bunch of modules.";
	};

	config = lib.mkIf config.gtoasted.other.enable {
		home.packages = let
      plg = jetbrains-plugins.idea-ultimate."2024.3.3"; 
      intellij = ( pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.idea-ultimate [
        # plg.IdeaVIM
        plg."com.intellij.spring"
        plg."com.intellij.spring.boot"
        plg."com.intellij.spring.boot.initializr"
        plg."org.jetbrains.plugins.spotbugs"
      ] );
    in with pkgs; [
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
      intellij
			kdePackages.dolphin
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
