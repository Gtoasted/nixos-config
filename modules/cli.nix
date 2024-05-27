{ pkgs, ... }: {
  home-manager.users."arne" = {
    programs.vim.enable = true;
    
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        nvim-tree-lua
        nvim-web-devicons
        nvim-lspconfig
        nvim-cmp
        telescope-nvim
        nvim-treesitter
        nvim-autopairs
        indent-blankline-nvim
        luasnip
      ];
    };
  };
}
