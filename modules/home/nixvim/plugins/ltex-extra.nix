{ config, lib, ... }:
{
  options.gtoasted.neovim.plugins.ltex-extra = {
    enable = lib.mkEnableOption "Enable the ltex-extra neovim plugin.";
  };

  config = lib.mkIf config.gtoasted.neovim.plugins.ltex-extra.enable {
    plugins.ltex-extra = {
      enable = true;
      settings = {
        init_check = true;
        load_langs = [
          "de-DE"
        ];
        path = ".ltex";
      };
    };
  };
}
