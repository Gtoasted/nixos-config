{ config, lib, pkgs, ... }: {
	options.gtoasted.sddm = {
		enable = lib.mkEnableOption "Enable sddm.";
	};

	config = lib.mkIf config.gtoasted.sddm.enable {
    environment.systemPackages = with pkgs; [
      kdePackages.qtmultimedia
      (sddm-astronaut.override {
        embeddedTheme = "cyberpunk";
      })
    ];

		services.displayManager.sddm = {
			enable = true;
      package = pkgs.kdePackages.sddm;
			wayland.enable = true;
      theme = "sddm-astronaut-theme";
		};
	};
}
