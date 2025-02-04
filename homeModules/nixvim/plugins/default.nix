{ ... }: {
  imports = [
    ./cmp.nix
    ./lsp.nix
    ./nvim-tree.nix
		./vimtex.nix
    ./typst-vim.nix
    ./other.nix
  ];

	gtoasted.neovim.plugins = {
		cmp.enable = true;
		lsp.enable = true;
		nvim-tree.enable = true;
		vimtex.enable = true;
    typst-vim.enable = true;
	};
}
