-- Abbreviations 
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
	s({trig="module", snippetType="snippet", dscr="Template for making a nix module.", condition=math},
	  fmta([[
		{ config, lib, ...}: {
			options.gtoasted.neovim.<> = {
				enable = lib.mkEnableOption "Enable <>";
			};

			config = lib.mkIf config.gtoasted.neovim.<>.enable {
				<>
			};
		}
		]],
	  {i(1), i(2), rep(1), i(0)}
	  )
	),
}
