{ config, lib, ...}: {
  options.gtoasted.nh= {
    enable = lib.mkEnableOption "Enable nh, the nix helper.";
  };

  config = lib.mkIf config.gtoasted.nh.enable {
    programs.nh = {
      enable = true;
      flake = "/home/arne/.config/nixos";
      clean.enable = true;
      clean.extraArgs = "--keep 5 --keep-since 3d";
    };
  };
}
