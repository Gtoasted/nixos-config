#import "@preview/ctheorems:1.1.3": *
#import "@preview/physica:0.9.5": *

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
  set page(margin: (
    top: 0.5cm,
    bottom: 2cm,
    left: 0.5cm,
    right: 0.5cm,
  ))
  show: thmrules
  body
}

// Marker for lectures
#let lecture(number, date) = {
  heading(
    outlined: false,
    numbering: none,
    level: 2,
    text(red)[Vorlesung #number #h(1fr) #date.display("[day].[month].[year]")] )
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

#let thmbase(
  title,
  fill_color: white,
  line_color: black,
  title_color: black,
  identifier: "theorem",
  numbered: true
) = thmenv(
  identifier,
  "heading",
  none,
  (name, number, body, ..args) => [
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
      #h(1fr)
    ]
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

#let defn = thmgreen("Definition")
#let thm = thmred("Theorem")
#let satz = thmred("Satz")
#let lemma = thmred("Lemma")
#let corollary = thmblue("Korollar")

#let example = thmblue("Beispiel", numbered: false)
#let remark = thmblue("Bemerkung", numbered: false)

#let proof = thmred(
  "Beweis",
  fill_color: rgb("#FDFCFA"),
  numbered: false
)
