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
  hbar = [[\hbar]],

  aa = [[\alpha]],
  bb = [[\beta]],
  gam = [[\gamma]],
  del = [[\delta]],
  Del = [[\Delta]],
  ee = [[\varepsilon]],
  tht = [[\theta]],
  kk = [[\kappa]],
  lam = [[\lambda]],
  pi = [[\pi]],
  rho = [[\rho]],
  ss = [[\sigma]],
  SS = [[\Sigma]],
  tau = [[\tau]],
  phi = [[\phi]],
  vphi = [[\varphi]],
  psi = [[\psi]],
  mu = [[\mu]],
  nu = [[\nu]],
  om = [[\omega]],
  chi = [[\mathcal{X}]]
}

for k,v in pairs(letters) do
  table.insert(cfg,
    s({trig="(%d*)" .. k, regTrig=true, snippetType="autosnippet", dscr="", condition=math},
      {f(function(_, snip) return snip.captures[1] .. v end)}
  ))
end

return cfg
