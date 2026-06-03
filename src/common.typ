// ————————————————————————————————————————————————————————————————————————————
// LAYOUT
// ————————————————————————————————————————————————————————————————————————————

#let page-margin = (
  x: 0.45in,
  y: 0.45in,
)

#let bleed-x(
  fill: none,
  inset: 0pt,
  body,
) = {
  move(
    dx: -page-margin.x,
    block(
      width: 100% + page-margin.x * 2,
      fill: fill,
      inset: inset,
      body,
    )
  )
}

#let bleed-top(
  height,
  fill: none,
  inset: 0pt,
  body,
) = {
  move(
    dx: -page-margin.x,
    dy: -page-margin.y,
    block(
      width: 100% + page-margin.x * 2,
      height: height + page-margin.y,
      fill: fill,
      inset: inset,
      body,
    )
  )
}

// ————————————————————————————————————————————————————————————————————————————
// COLORS
// ————————————————————————————————————————————————————————————————————————————

#let electric = rgb("#2563eb")
#let ink = rgb("#10131a")
#let line-soft = rgb("#dbe3ef")

// ————————————————————————————————————————————————————————————————————————————
// TYPE
// ————————————————————————————————————————————————————————————————————————————

#let label-font = "Avenir Next"

#set text(
  font: "Avenir Next",
  size: 8.7pt,
  fill: ink,
)

// ————————————————————————————————————————————————————————————————————————————
// SMALL DESIGN COMPONENTS
// ————————————————————————————————————————————————————————————————————————————

#let label(body, fill: electric) = text(
  size: 7.35pt,
  tracking: 0.95pt,
  fill: fill,
  weight: 800,
  body,
)

#let page-kicker(body, accent: electric, line-color: line-soft) = block(width: 100%)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 8pt,
    align: horizon,
    [#label(body, fill: accent)],
    [#line(length: 100%, stroke: 0.55pt + line-color)],
  )
]

