{ config, lib, ...}: {
  options.gtoasted.neovim.plugins.typst-vim = {
    enable = lib.mkEnableOption "Enable typst.vim";
  };

  config = lib.mkIf config.gtoasted.neovim.plugins.typst-vim.enable {
    plugins.typst-vim = {
      enable = true;
      keymaps.watch = "<Leader>tw";
    };
  };
}
