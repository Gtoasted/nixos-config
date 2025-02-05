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

-- Automatically creates snippets that replace one letter with another
local cfg = {}
local letters = {
  RR = [[\R]],
  CC = [[\C]],

  HH = [[\mathcal{H}]],
	NN = [[\mathcal{N}]],
  hbar = [[\hbar]],

  aa = [[\alpha]],
  bb = [[\beta]],
	ee = [[\varepsilon]],

  ii = [[\infty]],

  epsilon = [[\varepsilon]],
  vepsilon = [[\epsilon]],
  vtheta = [[\vartheta]],
  vrho = [[\varrho]],
  phi = [[\varphi]],
  vphi = [[\phi]],
  Phi = [[\Phi]],
}
local greek = {
  "alpha",
  "beta",
  "gamma",
  "delta",
  -- "epsilon",
  "zeta",
  "eta",
  "theta",
  "iota",
  "kappa",
  "lambda",
  "mu",
  "nu",
  "xi",
  "pi",
  "rho",
  "tau",
  -- "phi",
  "psi",
  "omega",
}

for k,v in pairs(letters) do
  table.insert(cfg,
    s({trig="(%d*)" .. k, regTrig=true, snippetType="autosnippet", dscr="", condition=math},
      {f(function(_, snip) return snip.captures[1] .. v end)}
    )
  )
end

for _,v in pairs(greek) do
  table.insert(cfg,
    s({trig=v, snippetType="autosnippet", dscr="", condition=math},
      {t("\\" .. v)}
    )
  )

  local capital = v:gsub("^%l", string.upper)

  table.insert(cfg,
    s({trig=capital, snippetType="autosnippet", dscr="", condition=math},
      {t("\\" .. capital)}
    )
  )
end


return cfg
