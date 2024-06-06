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
  s({trig="**", snippetType="autosnippet", dscr="dot", condition=math},
    {t("\\cdot")}
  ),

  s({trig="xx", snippetType="autosnippet", dscr="cross", condition=math},
    {t("\\cp")}
  ),

  s({trig="nabla", snippetType="autosnippet", dscr="Nabla Operator", condition=math},
    {t("\\vec{\\nabla}")}
  ),

  s({trig="norm", snippetType="autosnippet", dscr="Norm", condition=math},
    fmta("\\left\\| <> \\right\\|",
    {i(1)}
    )
  ),

  s({trig="mat", snippetType="snippet", dscr="Matrix", condition=math},
    fmta([[
    \begin{pmatrix}
      <>
    \end{pmatrix}
    ]],
    {i(1)}
    )
  ),
}
