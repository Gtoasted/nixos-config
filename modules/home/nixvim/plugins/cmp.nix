{ config, lib, ... }:
{
  options.gtoasted.neovim.plugins.cmp = {
    enable = lib.mkEnableOption "Enable neovim plugin cmp.";
  };

  config = lib.mkIf config.gtoasted.neovim.plugins.cmp.enable {
    plugins.cmp = {
      enable = true;

      settings = {
        snippet.expand = ''
          function(args)
            require("luasnip").lsp_expand(args.body)
          end'';
        completion = {
          completeopt = "menu,menuone";
          keyword_length = 3;
        };
        mapping = {
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({select=true})";
          "<Tab>" = /*lua*/ ''
            cmp.mapping(function(fallback)
            						if require("luasnip").expand_or_jumpable() then
            							vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            						else
            							fallback()
            						end
            					end, {
            					"i",
            					"s",
            					}),'';
          "<S-Tab>" = /*lua*/ ''
            cmp.mapping(function(fallback)
            						if cmp.visible() then
            							cmp.select_prev_item()
            						elseif require("luasnip").jumpable(-1) then
            							vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            						else
            							fallback()
            						end
            					end, {
            						"i",
            						"s",
            					})'';
        };

        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "nvim_lua"; }
          { name = "buffer"; }
        ];
      };

      autoEnableSources = true;
    };
  };
}
