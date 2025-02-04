{ ... }: {
	imports = [
		./plugins
		./keymaps.nix
	];

	colorschemes.catppuccin.enable = true;

	opts = {
		shiftwidth = 2;
		tabstop = 0;
		softtabstop = 0;
    expandtab = true;
		smartindent = true;
		autoindent = true;

		number = true;
		relativenumber = true;
		numberwidth = 2;
	};

	clipboard = {
		register = "unnamedplus";
		providers.wl-copy.enable = true;
	};
}
