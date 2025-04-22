{ config, lib, ... }:
{
  options.gtoasted.neovim.plugins.auto-save = {
    enable = lib.mkEnableOption "Enable auto-save.";
  };

  config = lib.mkIf config.gtoasted.neovim.plugins.auto-save.enable {
    plugins.auto-save = {
      enable = true;
      settings = {
        trigger_events.immediate_save = [
          "TextChanged"
          "TextChangedI"
        ];
        condition = ''
          function(buf)
            local fn = vim.fn
            local utils = require("auto-save.utils.data")

            if utils.not_in(fn.getbufvar(buf, "&filetype"), { "typ", "typst" }) then
              return false
            end
            return true
          end
        '';
      };
    };
  };
}
