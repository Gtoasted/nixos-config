ls = require("luasnip")
s = ls.snippet
sn = ls.snippet_node
t = ls.text_node
i = ls.insert_node
f = ls.function_node
d = ls.dynamic_node
fmt = require("luasnip.extras.fmt").fmt
fmta = require("luasnip.extras.fmt").fmta
rep = require("luasnip.extras").rep

function replacement_snippets(input)
  local output = {}

  for k,v in pairs(input) do
    table.insert(output,
      s({trig=k, snippetType="autosnippet", dscr="", condition=math},
        {t(v)}
      )
    )
  end

  return output
end

function merge_tables(table1, table2)
  for k, v in pairs(table2) do
    table1[k] = v
  end

  return table1
end
