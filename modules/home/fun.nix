{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.gtoasted.fun = {
    enable = lib.mkEnableOption "Enable fun modules";
  };

  config = lib.mkIf config.gtoasted.fun.enable {
    home.packages = with pkgs; [
      spotify
      jellyfin-media-player
      prismlauncher
    ];
  };
}
