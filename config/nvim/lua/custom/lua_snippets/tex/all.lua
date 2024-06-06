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
  s({trig="beg", snippetType="snippet", dscr="Begin / End"},
    fmta([[
    \begin{<>}
    <>
    \end{<>}
    ]],
    {i(1), i(0), rep(1)}
    )
  ),

  s({trig="sec", snippetType="snippet", dscr="Section"},
    fmta([[
    \section{<>}
    <>
    ]],
    {i(1), i(0)}
    )
  ),

  s({trig="ssec", snippetType="snippet", dscr="Section"},
    fmta([[
    \subsection{<>}
    <>
    ]],
    {i(1), i(0)}
    )
  ),

  s({trig="sssec", snippetType="snippet", dscr="Section"},
    fmta([[
    \subsubsection{<>}
    <>
    ]],
    {i(1), i(0)}
    )
  ),

  s({trig="par", snippetType="snippet", dscr="Paragraph"},
    fmta("\\paragraph{<>}\n<>",
    {i(1), i(0)}
    )
  ),

  s({trig="enum", snippetType="snippet", dscr="Enumeration"},
    fmta([[
    \begin{enumerate}
      \item <>
    \end{enumerate}
    ]],
    {i(1)}
    )
  ),

  s({trig="ita", snippetType="snippet", dscr="italicized"},
    fmta("\\textit{<>}",
    {i(1)}
    )
  ),

  s({trig="lst", snippetType="snippet", dscr="Java Code Block"},
    fmta([[
    \begin{lstlisting}[language=Java]
    <>
    \end{lstlisting}
    ]],
    {i(1)}
    )
  ),
}
