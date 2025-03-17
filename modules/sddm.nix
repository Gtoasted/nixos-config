{ config, lib, pkgs, ... }: {
	options.gtoasted.sddm = {
		enable = lib.mkEnableOption "Enable sddm.";
	};

	config = lib.mkIf config.gtoasted.sddm.enable {
    environment.systemPackages = let
      sddm-astronaut = pkgs.sddm-astronaut.overrideAttrs (final: prev: {
        installPhase =
          let
            theme = "cyberpunk";
            basePath = "$out/share/sddm/themes/sddm-astronaut-theme";
          in
            prev.installPhase + ''
              ${lib.getExe pkgs.gnused} -ie "/^ConfigFile/c ConfigFile=Themes/${theme}.conf" ${basePath}/metadata.desktop
            '';
      });
    in with pkgs; [
      kdePackages.qtmultimedia
      sddm-astronaut
    ];

		services.displayManager.sddm = {
			enable = true;
      package = pkgs.kdePackages.sddm;
			wayland.enable = true;
      theme = "sddm-astronaut-theme";
		};
	};
}

