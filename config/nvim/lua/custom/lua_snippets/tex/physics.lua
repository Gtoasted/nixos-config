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

local cfg = {}

-- Snippets that wrap a single character
local modifiers = {
  v = [[\vec{%s}]],
  ["do"] = [[\dot{%s}]],
  ["ddo"] = [[\ddot{%s}]],
  dv = [[\dot{\vec{%s}}]],
  ddv = [[\ddot{\vec{%s}}]],
  t = [[\tilde{%s}]],
  h = [[\hat{%s}]],
  o = [[\overline{%s}]],
}

for k,v in pairs(modifiers) do
  table.insert(cfg,
    s({trig="(.)%."..k, regTrig=true, snippetType="autosnippet", dscr="", condition=math},
      {f(function (_, snip)
        return string.format(v, snip.captures[1])
      end)}
    )
  )
  table.insert(cfg,
    s({trig=[[(\.*)%.]]..k, regTrig=true, snippetType="autosnippet", dscr="", condition=math},
      {f(function (_, snip)
        return string.format(v, snip.captures[1])
      end)}
    )
  )
end

-- More physics snippets
local other = {
  s({trig="(.*)%.rt", regTrig=true, snippetType="autosnippet", dscr="Function of r and t", condition=math},
    {f(function (_, snip)
      return snip.captures[1] .. "(\\vec{r},t)"
    end)}
  ),

  s({trig="bra ", snippetType="autosnippet", dscr="Bra", condition=math},
    fmta([[\bra{<>}<>]],
    {i(1), i(0)}
    )
  ),

  s({trig="ket ", snippetType="autosnippet", dscr="Ket", condition=math},
    fmta([[\ket{<>}<>]],
    {i(1), i(0)}
    )
  ),

  s({trig="braket", snippetType="autosnippet", dscr="Ket", condition=math},
    fmta([[\braket{<>}{<>} <>]],
    {i(1), i(2), i(0)}
    )
  ),

  s({trig="ketbra", snippetType="autosnippet", dscr="Ket", condition=math},
    fmta([[\ketbra{<>}{<>} <>]],
    {i(1), i(2), i(0)}
    )
  ),

  s({trig="mean", snippetType="autosnippet", dscr="Mean", condition=math},
    fmta([[\langle <> \rangle]],
    {i(1)}
    )
  ),
}

-- merge tables
for k, v in pairs(other) do
  cfg[k] = v
end

return cfg
