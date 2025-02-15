return {
  -- Enter Math Mode
  s({trig="mk", snippetType="autosnippet", dscr="Inline math."},
    fmta("$<>$",
    {i(1)}
    )
  ),

  s({trig="dm", snippetType="autosnippet", dscr="Display math."},
    fmta("$ <> $",
    {i(1)}
    )
  ),

  -- Quantors
  s({trig="EE", snippetType="autosnippet", dscr="Existence quantor"},
    {t("∃")}
  ),

  s({trig="AA", snippetType="autosnippet", dscr="For all"},
    {t("∀")}
  ),
}
