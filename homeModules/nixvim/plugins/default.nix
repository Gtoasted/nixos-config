{ ... }: {
  imports = [
    ./cmp.nix
    ./floaterm.nix
    ./lsp.nix
    ./ltex-extra.nix
    ./nvim-tree.nix
		./vimtex.nix
    ./typst-vim.nix
    ./typescript-tools.nix
    ./other.nix
  ];

	gtoasted.neovim.plugins = {
		cmp.enable = true;
    floaterm.enable = true;
		lsp.enable = true;
    ltex-extra.enable = true;
		nvim-tree.enable = true;
		vimtex.enable = true;
    typst-vim.enable = true;
    typescript-tools.enable = false;
	};
}
