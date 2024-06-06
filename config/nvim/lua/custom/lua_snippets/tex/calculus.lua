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
  s({trig="df", snippetType="autosnippet", dscr="Differential d", condition=math},
    {t("\\d")}
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
    fmta([[
    \int <> \; \dd{<>}
    ]],
    {i(1), i(2)}
    )
  ),

  s({trig="int1", snippetType="autosnippet", dscr="Integral with bounds", condition=math},
    fmta([[
    \int_{<>}^{<>} <> \; \dd{<>}
    ]],
    {i(1), i(2), i(3), i(4)}
    )
  ),

  s({trig="int2", snippetType="autosnippet", dscr="Double Integral with bounds", condition=math},
    fmta([[
    \int_{<>}^{<>}\;\dd<> \;\int_{<>}^{<>}\;\dd{<>} \; <> 
    ]],
    {i(1), i(2), i(3), i(4), i(5), i(6), i(7)}
    )
  ),

  s({trig="intf", snippetType="autosnippet", dscr="Area Integral", condition=math},
    fmta([[
    \int_{F} <> \;\dd{\vec{F}}
    ]],
    {i(1)}
    )
  ),

  s({trig="intv", snippetType="autosnippet", dscr="Volume Integral", conditon=math},
    fmta([[
    \int_{V} <> \;\dd{V}
    ]],
    {i(1)}
    )
  ),

  s({trig="inti", snippetType="autosnippet", dscr="Interal over the Real numbers", condition=math},
    fmta([[
    \int_{-\infty}^{\infty} <> \;\dd{<>}
    ]],
    {i(1), i(2)}
    )
  ),

  s({trig="int_", snippetType="autosnippet", dscr="n-d Integral with custom bound", condition=math},
    fmta([[
    \int_{<>} <> \;\dd{<>}
    ]],
    {i(1), i(2), i(3)}
    )
  ),
}
