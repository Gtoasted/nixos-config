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

-- Check if math mode is active
local function math()
  return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

return {
  s({trig="()", snippetType="autosnippet", dscr="Parentheses", condition=math},
    fmta("\\qty( <> )",
    {i(1)}
    )
  ),

  s({trig="[]", snippetType="autosnippet", dscr="Brackets", condition=math},
    fmta("\\qty[ <> ]",
    {i(1)}
    )
  ),

  s({trig="<>", snippetType="autosnippet", dscr="Left and right angle", condition=math},
    fmta("\\langle <> \\rangle",
    {i(1)}
    )
  ),

  s({trig=" set", snippetType="autosnippet", dscr="Braces for sets", condition=math},
    fmta([[ \qty{<>}]],
    {i(1)}
    )
  ),
}
