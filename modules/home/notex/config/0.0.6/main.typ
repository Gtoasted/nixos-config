#import "@preview/ctheorems:1.1.3": *
#import "@preview/physica:0.9.5": *
#import "@preview/unify:0.7.1": *

#let fix_proofs(body) = {
  // body.fields()
  body
}

// Template for lecture notes
#let general(body) = {
  set heading(
    // numbering: "1."
    numbering: (..nums) => nums
      .pos()
      .map(str)
      .join(".") + h(0.75em)
  )
  set text(
    font: "New Computer Modern",
    size: 12pt,
    tracking: -0.025em,
    
  )
  set page(
    margin: (
      top: 1cm,
      bottom: 2cm,
      left: 1cm,
      right: 1cm,
    ),
    numbering: "1"
  )
  show: thmrules
  show: fix_proofs
  body
}

#let exercises(body) = {
  set heading(
    numbering: (..nums) => ("Aufgabe " + nums
      .pos()
      .map(str)
      .join("."))
  )
  body
}


// Marker for lectures
#let lecture(number, date) = {
  text(
    red,
    weight: "extrabold",
    size: 1.25em
  )[Vorlesung #number #h(1fr) #date.display("[day].[month].[year]") \ ]
}

// Marker for Missing figures
#let missing_figure(identifier, caption: "") = {
set text(white, font: "FreeSans")
  set align(center)
  rect(
    fill: blue,
    radius: 0.5em,
    inset: 0.75em,
    [
      *Hier Abbildung #identifier einfügen.* \
      (#caption)
    ]
  )
}

// Header for exercises
#let exercise(index , semester, author, lecture, lecturer) = [
  Heinrich-Heine-Universität #h(1fr) _Abgabe von:_ \
  #semester #h(1fr) #author \
  #lecture \
  #lecturer
  #v(1em)
  #text(size: 3em)[Übungsblatt #index] \
  #line(length: 100%)
]

// Math Stuff
#let End = math.op("End")

// Theorem Stuff
#let thmbase(
  title,
  fill_color: white,
  line_color: black,
  title_color: black,
  identifier: "theorem",
  numbered: true,
) = thmenv(
  if numbered { identifier } else { "none" },
  "heading",
  2,
  (name, number, body, ..args) => [
    #if title == "Beweis" {v(-1.2em)}
    #box(
      fill: fill_color,
      inset: 0.5em,
      stroke: (
        left: 2pt + line_color
      ),
    )[
      #text(title_color, font: "TeX Gyre Heros")[*#title#if numbered [ #number]*#if name != none [ (#name)]*.*]
      #h(0.2em)
      #body
      #h(1fr) #if title == "Beweis" {math.square.filled}
    ] #label("thm")
  ]
)

#let thmred = thmbase.with(
  fill_color: rgb("#f3e9e2"),
  line_color: rgb("#964007"),
  title_color: rgb("#7A4725")
)

#let thmgreen = thmbase.with(
  fill_color: rgb("#EFF7F2"),
  line_color: rgb("#009A55"),
  title_color: rgb("#37835E")
)

#let thmblue = thmbase.with(
  fill_color: rgb("#EFF3FA"),
  line_color: rgb("#006EB8"),
  title_color: rgb("#436A99")
)

#let thmyellow = thmbase.with(
  fill_color: rgb("#FFFFFF"),
  line_color: rgb("#FDBB42"),
  title_color: rgb("#BC9A5E")
)

#let defn = thmgreen("Definition")
#let thm = thmred("Satz")
#let satz = thm
#let lemma = thmred("Lemma")
#let corollary = thmblue("Korollar")

#let example = thmblue("Beispiel", numbered: true)
#let remark = thmblue("Bemerkung", numbered: true)
#let propostion = thmblue("Behauptung", numbered: false)

#let recall = thmyellow("Erinnerung", numbered: false)

#let proof = {
  thmred(
    "Beweis",
    fill_color: rgb("#FDFCFA"),
    numbered: false,
  )
}
