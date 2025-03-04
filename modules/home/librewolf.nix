{ config, lib, ...}: {
  options.gtoasted.librewolf= {
    enable = lib.mkEnableOption "Enable librewolf.";
  };

  config = lib.mkIf config.gtoasted.librewolf.enable {
    programs.librewolf = {
      enable = true;
    };
  };
}
