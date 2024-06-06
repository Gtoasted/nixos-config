local cmp = require "cmp"

local viewer = ''
if package.config:sub(1,1) == '/' then
  viewer = 'zathura'
else
  viewer = 'general'
end

return {
	{'lervag/vimtex',
    lazy = false,
    config = function(_)
      vim.g.tex_flavor='latex'
      vim.g.vimtex_view_method=viewer
      vim.g.vimtex_general_viewer_method='SumatraPDF'
      vim.g.vimtex_quickfix_mode=0
      vim.opt.conceallevel=1
      --vim.g.vimtex_syntax_conceal={}
      vim.cmd([[
      hi Conceal ctermbg=none
      ]])
      vim.g.vimtex_syntax_custom_cmds = {
        {name = 'vec', mathmode = true , conceal = true, argstyle = 'bold'}
      }
    end
  },{'L3MON4D3/LuaSnip',
    opts = {
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    }
  },{'rafamadriz/friendly-snippets',
    enabled = false,
  },{'hrsh7th/nvim-cmp',
    opts = {
      completion = {keyword_length = 3},
      mapping = {
        ["Up"] = cmp.mapping.select_prev_item(),
        ["Down"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, {
        "i",
        "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
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
        })
      }
    }
  },{"windwp/nvim-autopairs",
    opts = {
      disable_filetype = {'tex'},
    }
  },{"williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "texlab",
      }
    }
  },{"neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  }
}
