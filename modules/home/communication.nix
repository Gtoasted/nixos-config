{ config, lib, pkgs, ...}: {
  options.gtoasted.communication= {
    enable = lib.mkEnableOption "Enable programs related to communication.";
  };

  config = lib.mkIf config.gtoasted.communication.enable {
    home.packages = with pkgs; [
			discord
			element-desktop
			signal-desktop
			thunderbird
      cinny-desktop
    ];
  };
}
