{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.gtoasted.nvidia = {
    enable = lib.mkEnableOption "Enable nvidia driver.";
  };

  config = lib.mkIf config.gtoasted.nvidia.enable {
    hardware.graphics = {
      enable = true;
      extraPackages = [
        pkgs.nvidia-vaapi-driver
      ];
    };

    services.xserver.videoDrivers = [
      "nvidia"
    ];
    hardware.nvidia.open = false;
  };
}
