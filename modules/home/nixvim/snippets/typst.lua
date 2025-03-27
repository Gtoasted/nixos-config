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

local function math()
  return vim.api.nvim_eval("typst#in_math()") == 1
end

local function merge_tables(...)
  local output = {}
  local inputs = {...}

  for _, input in pairs(inputs) do
    for _, entry in pairs(input) do
      table.insert(output, entry)
    end
  end

  return output
end

local function make_letter_snippets(input, condition)
  local output = {}

  for k, v in pairs(input) do
    table.insert(output,
      s({trig=k, snippetType="autosnippet", condition=condition},
        {t(v)}
      )
    )
  end

  return output
end

local letter_snippets = make_letter_snippets({
  EE = "∃",
  AA = "∀",

  int = "integral",
  integrali = "integral_oo^oo",
  integralr = "integral_(RR^3)",
  ["**"] = "dot",
  xx = "times",

  -- Greek letters
  Alpha = "Α",
  alpha = "α",
  aa = "α",
  Beta = "Β",
  beta = "β",
  bb = "β",
  Gamma = "Γ",
  gamma = "γ",
  Delta = "Δ",
  delta = "δ",
  Epsilon = "Ε",
  epsilon = "ε",
  ee = "ε",
  vepsilon = "ϵ",
  Zeta = "Ζ",
  zeta = "ζ",
  Eta = "Η",
  eta = "η",
  Theta = "Θ",
  theta = "θ",
  vtheta= "ϑ",
  Iota = "Ι",
  iota = "ι",
  Kappa = "Κ",
  kappa = "κ",
  Lambda = "Λ",
  lambda = "λ",
  Mu = "Μ",
  mu = "μ",
  Nu = "Ν",
  nu = "ν",
  Xi = "Ξ",
  xi = "ξ",
  Omicron = "Ο",
  omicron = "ο",
  Pi = "Π",
  pi = "π",
  Rho = "Ρ",
  rho = "ρ",
  vrho = "ϱ",
  Sigma = "Σ",
  sigma = "σ",
  Tau = "Τ",
  tau = "τ",
  Upsilon = "Υ",
  upsilon = "υ",
  Phi = "Φ",
  phi = "φ",
  vphi = "ϕ",
  Chi = "Χ",
  chi = "χ",
  Psi = "Ψ",
  psi = "ψ",
  Omega = "Ω",
  omega = "ω",
}, math)

-- VERY hacky way to be able to tab out of parentheses
local function make_autopair_snippets(input)
  local output = {}

  for _, v in pairs(input) do
    table.insert(output,
      s({trig=v, snippetType="autosnippet", dscr=""},
        fmta(v .. "<>",
        {i(1)}
        )
      )
    )
  end

  return output
end

local autopairs = make_autopair_snippets({
  "()",
  "[]",
  "{}",
  "\"\"",
})

local other = {
  -- Math mode
  s({trig="mk", snippetType="autosnippet", dscr="Inline Math."},
    fmta("$<> $",
    {i(1)}
    )
  ),

  s({trig="dm", snippetType="autosnippet", dscr="Display Math."},
    fmta("$ <> $",
    {i(1)}
    )
  ),

  -- Sub- and Superscript
  s({trig="(.*)__", regTrig='true', snippetType="autosnippet", dscr="Automatically add parentheses around subscripts", condition=math},
    fmta("<>_(<>)",{
        f(function(_, snip) return snip.captures[1] end),
        i(1)
      }
    )
  ),

  s({trig="(.*)^^", regTrig='true', snippetType="autosnippet", dscr="Automatically add parentheses around subscripts", condition=math},
    fmta("<>^(<>)",{
        f(function(_, snip) return snip.captures[1] end),
        i(1)
      }
    )
  ),

  -- Operators

  s({trig="lim", snippetType="autosnippet", dscr="Limit", condition=math},
    fmta("lim_(<> → <>)",
    {i(1), i(2)}
    )
  ),

  s({trig="<>", snippetType="autosnippet", dscr="Left and right angel", condition=math},
    fmta("angle.l <> angle.r",
    {i(1)}
    )
  ),

  s({trig="dd", snippetType="autosnippet", dscr="Differential d."},
    {t("dif")}
  ),
}

return merge_tables(letter_snippets, autopairs, other)
