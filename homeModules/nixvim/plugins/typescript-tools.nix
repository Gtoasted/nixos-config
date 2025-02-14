{ config, lib, ...}: {
  options.gtoasted.neovim.plugins.typescript-tools = {
    enable = lib.mkEnableOption "Enable typescript-tools.";
  };

  config = lib.mkIf config.gtoasted.neovim.plugins.typescript-tools.enable {
    plugins.typescript-tools.enable = true;
  };
}
