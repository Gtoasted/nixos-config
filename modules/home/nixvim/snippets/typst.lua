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

local letter_snippets = make_letter_snippets({
  EE = "∃",
  AA = "∀",

  int = "integral",
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

local other = {
  -- Parentheses
  s({trig="(", snippetType="autosnippet", dscr="Automatic Parentheses."},
    fmta("(<>)",
    {i(1)}
    )
  ),

  s({trig="[", snippetType="autosnippet", dscr="Automatic Brackets."},
    fmta("[<>]",
    {i(1)}
    )
  ),

  s({trig="{", snippetType="autosnippet", dscr="Automatic curly Braces."},
    fmta("{<>}",
    {i(1)}
    )
  ),

  -- Math mode
  s({trig="mk", snippetType="autosnippet", dscr="Inline Math."},
    fmta("$<>$",
    {i(1)}
    )
  ),

  s({trig="dm", snippetType="autosnippet", dscr="Display Math."},
    fmta("$ <> $",
    {i(1)}
    )
  ),

  -- Sub- and Superscript
  s({trig="(.*)__", regTrig='true', snippetType="autosnippet", dscr="Automatically add braces around subscripts", condition=math},
    fmta("<>_(<>)",{
        f(function(_, snip) return snip.captures[1] end),
        i(1)
      }
    )
  ),

  s({trig="(.*)^^", regTrig='true', snippetType="autosnippet", dscr="Automatically add braces around subscripts", condition=math},
    fmta("<>^(<>)",{
        f(function(_, snip) return snip.captures[1] end),
        i(1)
      }
    )
  ),

  s({trig="lim", snippetType="autosnippet", dscr="Limit", condition=math},
    fmta("lim_(<> → <>)",
    {i(1), i(2)}
    )
  ),

  s({trig="sum1", snippetType="autosnippet", dscr="Sum with arguments", condition=math},
    fmta("sum_(<>)^(<>))",
    {i(1), i(2)}
    )
  ),

  s({trig="int1", snippetType="autosnippet", dscr="1-dimensional integral.", condition=math},
    fmta("integral_(<>)^(<>))",
    {i(1), i(2)}
    )
  ),

  s({trig="<>", snippetType="autosnippet", dscr="Left and right angel", condition=math},
    fmta("angle.l <> angle.r",
    {i(1)}
    )
  ),
}

return merge_tables(letter_snippets, other)
