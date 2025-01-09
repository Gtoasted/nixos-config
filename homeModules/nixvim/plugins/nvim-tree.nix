{ config, lib, ... }: {
	options.gtoasted.neovim.plugins.nvim-tree = {
		enable = lib.mkEnableOption "Enable neovim plugin nvim-tree.";
	};

	config = lib.mkIf config.gtoasted.neovim.plugins.nvim-tree.enable {
		plugins.nvim-tree = {
			enable = true;
			autoClose = true;
			disableNetrw = true;
			hijackCursor = true;
			hijackUnnamedBufferWhenOpening = false;
			syncRootWithCwd = true;

			view = {
				side = "right";
				width = 30;
				preserveWindowProportions = true;
			};
		};
	};
}
