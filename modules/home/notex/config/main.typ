#import "@preview/ctheorems:1.1.3": *
#import "@preview/physica:0.9.4": *

// Template for lecture notes
#let lecture_notes(body) = {
  set heading(numbering: "1.")
  set text(font: "New Computer Modern")
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

#let thmbase(
  title,
  fill_color: white,
  line_color: black,
  title_color: black
) = {
  thmenv(
    lower(title),
    "heading",
    none,
    (name, number, body) => [
      #box(
        fill: fill_color,
        inset: 0.5em,
        stroke: (
          left: 2pt + line_color
        ),
      )[
        #text(title_color, font: "TeX Gyre Heros")[*#title #number*#if name != none [ (#name)]*.*]
        #h(0.2em)
        #body
        #h(1fr)
      ]
    ]
  )
}

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
