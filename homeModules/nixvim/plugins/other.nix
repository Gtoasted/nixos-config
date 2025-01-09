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
				];

				highlight = {
					enable = true;
					# For some reason, tex highlighting breaks some snippets
					disable = "function(lang) return lang == 'latex' end";
				};
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

		nvim-autopairs = {
			enable = true;
			disabled_filetype = [
				"tex"
			];
		};

    web-devicons.enable = true;
    indent-blankline.enable = true;
		comment.enable = true;
		bufdelete.enable = true;
		nvim-surround.enable = true;
  };
}
