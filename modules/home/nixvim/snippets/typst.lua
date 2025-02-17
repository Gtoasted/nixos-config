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
  ["=>"] = "⇒",
  ["<=>"] = "⇔",
  ["->"] = "→",
  int = "integral"
  -- ["int "] = "integral ",
  -- ["int_"] = "integral_"
}, math)

local other = {
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

  s({trig="int1", snippetType="autosnippet", dscr="1-dimensional integral."},
    fmta("integral_(<>)^(<>))",
    {i(1), i(2)}
    )
  ),
}

return merge_tables(letter_snippets, other)
