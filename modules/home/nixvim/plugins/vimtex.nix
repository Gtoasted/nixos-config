{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.gtoasted.neovim.plugins.vimtex = {
    enable = lib.mkEnableOption "Enable neovim plugin vimtex.";
  };

  config = lib.mkIf config.gtoasted.neovim.plugins.vimtex.enable {
    plugins.vimtex = {
      enable = true;
      texlivePackage = pkgs.texliveFull;
      settings = {
        view_method = "zathura";
        quickfix_mode = 0;
        syntax_custom_cmds = [
          {
            name = "vec";
            mathmode = true;
            conceal = true;
            argstyle = "bold";
          }
        ];
        syntax_custom_cmds_with_concealed_delims = [
          {
            name = "frac";
            nargs = 2;
            mathmode = true;
            cchar_open = "(";
            cchar_mid = "/";
            cchar_close = ")";
          }
        ];
        opts.conceallevel = 1;
      };
    };
  };
}
