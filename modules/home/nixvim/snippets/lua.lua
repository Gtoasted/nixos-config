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

return {
  s({trig="fsnip", snippetType="autosnippet", dscr="Snippet to create snippets"},
    fmta([[
    s({trig="<>", snippetType="<>", dscr="<>", condition=math},
      fmta(<>,
      {<>}
      )
    ),
    ]],
    {i(1), i(2), i(3), i(4), i(5)}
    )
  ),

  s({trig="tsnip", snippetType="autosnippet", dscr="Snippet that inserts text"},
    fmta([[
    s({trig="<>", snippetType="autosnippet", dscr="<>", condition=math},
      {t("<>")}
    ),
    ]],
    {i(1), i(2), i(3)}
    )
  ),

  s({trig="lsnip", snippetType="autosnippet", dscr="Snippet that inserts a special letter"},
    fmta([[
    s({trig="<>", snippetType="autosnippet", dscr="<>", condition=math},
      {t("<>")}
    ),
    ]],
    {i(1), i(2), i(3)}
    )
  ),

  s({trig="msnip", snippetType="autosnippet", dscr="Snippet that modifies preceding text"},
    fmta([[
    s({trig="(.*)%.<>", regTrig=true, snippetType="autosnippet", dscr="<>", condition=math},
      {f(function (_, snip)
        return snip.captures[1] .. "<>"
      end)}
    ),
    ]],
    {i(1), i(2), i(3)}
    )
  ),
}
