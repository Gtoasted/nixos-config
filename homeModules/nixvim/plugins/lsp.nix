{ config, lib, pkgs, ... }: {
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
          package = pkgs.ltex-ls-plus;
          cmd = [
            "ltex-ls-plus"
          ];
				  settings = {
            enabled = [
              "latex"
              "typst"
            ];
				    completionEnabled = true;
				    language = "de-DE";
				  };
				};
				texlab.enable = true;
			};
		};
    autoCmd = [
      {
        # Idk how to properly configure this in the lsp plugin above
        command = "LspStart ltex";
        event = [
          "BufEnter"
          "BufWinEnter"
        ];
        pattern = [
          "*.typ"
          "*.typst"
        ];
      }
    ];
	};
}
