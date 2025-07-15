{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.gtoasted.neovim.plugins.lsp = {
    enable = lib.mkEnableOption "Enable neovim plugin lsp.";
  };

  config = lib.mkIf config.gtoasted.neovim.plugins.lsp.enable {
    plugins.lsp = {
      enable = true;
      servers = {
        lua_ls.enable = true;
        nixd.enable = true;
        ltex_plus = {
          enable = true;
          package = pkgs.ltex-ls-plus;
          settings.ltex = {
            enabled = [
              "latex"
              "typst"
            ];
            completionEnabled = true;
            language = "de-DE";
          };
        };
        texlab.enable = true;
        tinymist.enable = true;
        ts_ls.enable = true;
        clangd.enable = true;
      };
      keymaps = {
        diagnostic = {
          gj = "goto_next";
          gk = "goto_prev";
        };
        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
          ca = "code_action";
        };
      };
    };
  };
}
