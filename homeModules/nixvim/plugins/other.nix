{
  plugins = {
		bufferline = {
			enable = true;
			settings.options = {
				diagnostics = "nvim_lsp";
				offsets = [
					{
						filetype = "NvimTree";
						text = {__raw = "function() return vim.fn.getcwd() end";};
						highlight = "Directory";
						separator = true;
					}
				];
			};
		};

		treesitter = {
			enable = true;
			settings = {
				auto_install = false;
				ensure_installed = [
					"nix"
					"lua"
					"latex"
				];

				highlight.enable = true;
				indent.enable = true;
			};
		};

		lualine = {
			enable = true;
			settings.options = {
				disabled_filetypes = {
					NvimTree = {};
				};
				globalstatus = true;
			};
		};

		luasnip = {
			enable = true;
			settings.enable_autosnippets = true;
			fromLua = [{
				paths = ../snippets;
			}];
		};

    web-devicons.enable = true;
    indent-blankline.enable = true;
		nvim-autopairs.enable = true;
		comment.enable = true;
		bufdelete.enable = true;
		nvim-surround.enable = true;
  };
}
