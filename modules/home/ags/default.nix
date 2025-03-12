{ inputs, pkgs, config, lib, ...}: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  options.gtoasted.ags = {
    enable = lib.mkEnableOption "Enable ags.";
  };

  config = lib.mkIf config.gtoasted.ags.enable {
    programs.ags = {
      enable = true;
      configDir = ./config;
      extraPackages = with inputs.ags.packages.${pkgs.system}; [
        hyprland
        mpris
        battery
        wireplumber
        network
        tray
      ];
    };
  };
}
