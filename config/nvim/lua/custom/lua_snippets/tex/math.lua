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
  -- Enter Math Mode
  s({trig="mk", snippetType="autosnippet", dscr="Inline math mode"},
    fmta("$<>$",
    {i(1)}
    )
  ),

  s({trig="dm", snippetType="autosnippet", dscr="Multiline math mode"},
    fmta("$$ <> $$",
      {i(1)}
    )
  ),

  -- General
  -- Quantors
  s({trig="EE", snippetType="autosnippet", dscr="Existance Quantor", condition=math},
    {t("\\exists")}
  ),

  s({trig="AA", snippetType="autosnippet", dscr="For all", condition=math},
    {t("\\forall")}
  ),

  -- Operators
  s({trig="//", snippetType="autosnippet", dscr="Fraction", condition=math},
    fmta([[\frac{<>}{<>}]],
    {i(1),i(2)}
    )
  ),

  s({trig="(%w)/", regTrig=true, snippetType="autosnippet", dscr="Fraction", condition=math},
    fmta("\\frac{<>}{<>}",{
        f(function(_, snip) return snip.captures[1] end),
        i(1),
      }
    )
  ),

  s({trig="root2", snippetType="autosnippet", dscr="Square root", condition=math},
    fmta("\\sqrt{<>}",
    {i(1)}
    )
  ),

  s({trig="root(%d)", regTrig=true, snippetType="autosnippet", dscr="nth root", condition=math},
    fmta("\\sqrt[<>]{<>}",{
        f(function(_, snip) return snip.captures[1] end),
        i(1)
      }
    )
  ),

  s({trig="lim", snippetType="autosnippet", dscr="Limit", condition=math},
    fmta("\\lim_{<> \\rightarrow <>} <>",
    {i(1), i(2), i(3)}
    )
  ),

  -- Relations
  s({trig="=>", snippetType="autosnippet", dscr="Implies", condition=math},
    {t("\\implies")}
  ),

  s({trig="<->", snippetType="autosnippet", dscr="Equiv Arrow", condition=math},
    {t("\\Leftrightarrow")}
  ),

  s(
    {trig="->", snippetType="autosnippet", dscr="Goes to", condition=math},
    {t("\\rightarrow")}
  ),

  s({trig=":=", snippetType="autosnippet", dscr="Colon Equals", condition=math},
    {t("\\coloneqq")}
  ),

  -- Other
  s({trig="sum ", snippetType="autosnippet", dscr="Sum", condition=math},
    fmta([[
    \sum_{<>}^{<>} <>
    ]],
    {i(1), i(2), i(0)}
    )
  ),

  s({trig="sum_", snippetType="autosnippet", dscr="Sum", condition=math},
    fmta([[
    \sum_{<>} <>
    ]],
    {i(1), i(0)}
    )
  ),

  s({trig="(.*)__", regTrig='true', snippetType="autosnippet", dscr="Automatically add braces around subscripts", condition=math},
    fmta("<>_{<>}",{
        f(function(_, snip) return snip.captures[1] end),
        i(1)
      }
    )
  ),

  s({trig="(.*)^^", regTrig='true', snippetType="autosnippet", dscr="Automatically add braces around subscripts", condition=math},
    fmta("<>^{<>}",{
        f(function(_, snip) return snip.captures[1] end),
        i(1)
      }
    )
  ),
}
