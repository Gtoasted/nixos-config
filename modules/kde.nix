{ config, lib, ... }:
{
  options.gtoasted.kde = {
    enable = lib.mkEnableOption "Enable KDE Plasma 5.";
  };

  config = lib.mkIf config.gtoasted.kde.enable {
    services.desktopManager.plasma6.enable = true;
  };
}
