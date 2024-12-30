{ lib, ... }: {
	imports = [
		./hyprland.nix
		./hyprlock.nix
		./hypridle.nix
		./hyprshot.nix
		./dunst.nix
		../waybar
		../rofi
	];

	gtoasted = {
		hyprland.enable = lib.mkDefault true;
		hyprlock.enable = lib.mkDefault true;
		hypridle.enable = lib.mkDefault true;
		hyprshot.enable = lib.mkDefault true;
		dunst.enable = lib.mkDefault true;
		waybar.enable = lib.mkDefault true;
		rofi.enable = lib.mkDefault true;
	};
}
