#let page-margin = (
  x: 0.5in,
  y: 0.5in,
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
