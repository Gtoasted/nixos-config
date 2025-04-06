{ config, lib, pkgs, ...}: {
  options.gtoasted.tools= {
    enable = lib.mkEnableOption "Enable some management tools.";
  };

  config = lib.mkIf config.gtoasted.tools.enable {
    home.packages = with pkgs; [
			nwg-displays
			pavucontrol
			kdePackages.dolphin
      keepassxc
    ];
  };
}
