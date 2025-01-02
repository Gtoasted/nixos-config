{ pkgs, ... }: {
	plugins.vimtex = {
		enable = true;
		texlivePackage = pkgs.texliveFull;
		settings = {
			view_method = "zathura";
			quickfix_mode = 0;
			syntax_custom_cmds = [
				{
					name = "vec";
					mathmode = true;
					conceal = true;
					argstyle = "bold";
				}
			];
			syntax_custom_cmds_with_concealed_delims = [
				{
					name = "frac";
					nargs = 2;
					mathmode = true;
					cchar_open="(";
					cchar_mid="/";
					cchar_close=")";
				}
			];
		};
	};

	opts.conceallevel = 1;
}
# config = function(_)
#   vim.cmd([[
#   hi Conceal ctermbg=none
#   ]])
# end