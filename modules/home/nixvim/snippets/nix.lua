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
	s({trig="module", snippetType="snippet", dscr="Template for making a nix module."},
	  fmta([[
		{ config, lib, ...}: {
			options.<> = {
				enable = lib.mkEnableOption "Enable <>";
			};

			config = lib.mkIf config.<>.enable {
				<>
			};
		}
		]],
	  {i(1), i(2), rep(1), i(0)}
	  )
	),
}
