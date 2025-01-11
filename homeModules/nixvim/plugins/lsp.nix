{ config, lib, ... }: {
	options.gtoasted.neovim.plugins.lsp = {
		enable = lib.mkEnableOption "Enable neovim plugin lsp.";
	};

	config = lib.mkIf config.gtoasted.neovim.plugins.lsp.enable {
		plugins.lsp = {
			enable = true;
			servers = {
				lua_ls.enable = true;
				nixd.enable = true;
				ltex = {
				  enable = true;
				  settings = {
				    enabled = [ "latex" "tex" "text"];
				    completionEnabled = true;
				    language = "de-DE";
				  };
				};
				texlab.enable = true;
			};
		};
	};
}
