{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.gtoasted.graphics = {
    enable = lib.mkEnableOption "graphics.";
    nvidia = lib.mkEnableOption "nvida drivers.";
    intel = lib.mkEnableOption "intel drivers.";
  };

  config =
    let
      cfg = config.gtoasted.graphics;
    in
    lib.mkIf cfg.enable {
      hardware.graphics = {
        enable = true;
        extraPackages =
          [ ]
          ++ (if cfg.nvidia then [ pkgs.nvidia-vaapi-driver ] else [ ])
          ++ (
            if cfg.intel then
              [
                pkgs.vpl-gpu-rt
                pkgs.intel-compute-runtime
              ]
            else
              [ ]
          );
      };

      services.xserver = {
        enable = true;
        videoDrivers =
          [ ] ++ (if cfg.nvidia then [ "nvidia" ] else [ ]) ++ (if cfg.intel then [ "modesetting" ] else [ ]);
      };

      hardware.nvidia.open = lib.mkIf cfg.nvidia false;
      programs.dconf.enable = true; # idk what this does
    };
}
