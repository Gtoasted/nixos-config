return {
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

  -- Quantors
  s({trig="EE", snippetType="autosnippet", dscr="Existence Quantor."},
    {t("∃")}
  ),

  s({trig="AA", snippetType="autosnippet", dscr="For all Quantor"},
    {t("∀")}
  ),
}
