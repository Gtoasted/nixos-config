{ config, lib, pkgs, ...}: {
  options.gtoasted.terminal = {
    enable = lib.mkEnableOption "Enable terminal-related programs.";
  };

  config = lib.mkIf config.gtoasted.terminal.enable {
    programs.kitty = {
      enable = true;
    };

    home.packages = with pkgs; [
			wl-clipboard
			zip
			unzip
    ];

		programs.bash.enable = true;

		programs.starship = {
			enable = true;
			enableBashIntegration = true;
		};
  };
}
