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
  -- Differentiation
  s({trig="dd", snippetType="autosnippet", dscr="Differential d", condition=math},
    fmta([[\dd{<>}]],
    {i(1)}
    )
  ),

  s({trig="da", snippetType="autosnippet", dscr="Area differential", condition=math},
    {t([[\dd{\vec{A}}]])}
  ),

  s({trig="dv", snippetType="autosnippet", dscr="Volume differential", condition=math},
    {t([[\dd{\vec{V}}]])}
  ),

  s({trig="dl", snippetType="autosnippet", dscr="Partial differential", condition=math},
    {t("\\partial")}
  ),

  s({trig="pd1", snippetType="autosnippet", dscr="Partial derivative", condition=math},
    fmta("\\pdv{<>}{<>}<>",
    {i(1), i(2), i(0)}
    )
  ),

  s({trig="pdn", snippetType="autosnippet", dscr="Partial derivate, nth degree", conditon=math},
    fmta("pdv[<>]{<>}{<>}<>",
    {i(1), i(2), i(3), i(0)}
    )
  ),

  s({trig="d1", snippetType="autosnippet", dscr="Derivative", condition=math},
    fmta([[
    \dv{<>}{<>}<>
    ]],
    {i(1), i(2), i(0)}
    )
  ),

  s({trig="d2", snippetType="autosnippet", dscr="Derivative", condition=math},
    fmta([[
    \dv[2]{<>}{<>}<>
    ]],
    {i(1), i(2), i(0)}
    )
  ),

  -- Integration
  s({trig="int ", snippetType="autosnippet", dscr="Integral without bounds", condition=math},
    {t([[\int ]])}
  ),

  s({trig="int1", snippetType="autosnippet", dscr="Integral with bounds", condition=math},
    fmta([[
    \int_{<>}^{<>} 
    ]],
    {i(1), i(2)}
    )
  ),

  s({trig="int2", snippetType="autosnippet", dscr="Double Integral with bounds", condition=math},
    fmta([[
    \int_{<>}^{<>} <> \;\int_{<>}^{<>} <> 
    ]],
    {i(1), i(2), i(3), i(4), i(5), i(6)}
    )
  ),

  s({trig="intf", snippetType="autosnippet", dscr="Area Integral", condition=math},
    {t([[\int_F ]])}
  ),

  s({trig="intv", snippetType="autosnippet", dscr="Area Integral", condition=math},
    {t([[\int_V ]])}
  ),

  s({trig="inti", snippetType="autosnippet", dscr="Integral over the Real numbers", condition=math},
    t([[\int_{-\infty}^{\infty} ]])
  ),

  s({trig="int_", snippetType="autosnippet", dscr="n-d Integral with custom bound", condition=math},
    fmta([[\int_{<>} ]],
      {i(1)}
    )
  ),

  s({trig="intr", snippetType="autosnippet", dscr="Integral over all of space", condition=math},
    {t([[\int_{\R^3} ]])}
  ),
}
