{ config, lib, pkgs, ... }: {
	options.gtoasted.stylix = {
		enable = lib.mkEnableOption "Enable styling with stylix.";
	};

	config = lib.mkIf config.gtoasted.stylix.enable {
		stylix = {
			enable = true;

      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
			image = ../assets/wave.jpg;
			imageScalingMode = "center";

			cursor = {
				package = pkgs.catppuccin-cursors.mochaLight;
				name = "Catppuccin-Mocha-Light-Cursors";
				size = 16;
			};

			fonts = {
				monospace = {
					package = pkgs.nerd-fonts.jetbrains-mono;
					name = "JetBrainsMono";
				};
			};

      targets.grub.enable = false;
		};
	};
}
