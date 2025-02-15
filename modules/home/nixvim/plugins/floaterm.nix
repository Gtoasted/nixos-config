{ config, lib, ...}: {
  options.gtoasted.neovim.plugins.floaterm = {
    enable = lib.mkEnableOption "Enable floaterm";
  };

  config = lib.mkIf config.gtoasted.neovim.plugins.floaterm.enable {
    plugins.floaterm = {
      enable = true;
      settings = {
        height = 0.9;
        width = 0.9;
        opener = "edit ";
      };
    };
  };
}
