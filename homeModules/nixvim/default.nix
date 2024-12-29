{
  imports = [
    ./plugins
    ./keymaps.nix
  ];

  colorschemes.catppuccin.enable = true;

  opts = {
    shiftwidth = 2;
    tabstop = 2;
		softtabstop = 2;
    smartindent = true;
    autoindent = true;
  };

	clipboard.providers.wl-copy.enable = true;
}
