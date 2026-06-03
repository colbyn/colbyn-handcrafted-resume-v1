#import "common.typ": bleed-top, bleed-x, page-margin

#set par(spacing: 0pt, leading: 0pt)

// -----------------------------------------------------------------------------
// Cover palette
// -----------------------------------------------------------------------------

#let ink = rgb("#10131a")

#let sine-panel-fg-color = rgb("#ffffff")
// #let sine-panel-bg-color = rgb("#244e7d")
#let sine-panel-bg-color = rgb("#404144")

#let hero-title-color = sine-panel-fg-color
#let hero-stroke = 0.8pt + hero-title-color

// #let grid-line-color = rgb("#363434a0")
#let grid-line-color = rgb("#656d7aa0")
#let grid-cell = 20pt
#let grid-line-offset = 15pt
#let grid-line-width = 0.5pt

#let wave-shadow-colors = (
  sine-panel-bg-color.transparentize(75%),
  sine-panel-bg-color.transparentize(48%),
  sine-panel-bg-color.transparentize(8%).mix(rgb("#00000088")),
)

// The grid pattern restarts in the wave fill. That is fine as long as the
// rectangular hero height is an exact multiple of the grid cell.
// If you change this, keep it at 180pt, 200pt, 220pt, etc.
#let hero-panel-height = 135pt + (page-margin.y/2)

// -----------------------------------------------------------------------------
// Small text components
// -----------------------------------------------------------------------------

#let pill-label(body) = [
  #set text(size: 13pt, weight: 300, font: "Avenir")
  #align(center)[#body]
]

// -----------------------------------------------------------------------------
// Shared grid fill
// -----------------------------------------------------------------------------

#let colored-grid = tiling(size: (grid-cell, grid-cell))[
  #let bg-color = sine-panel-bg-color
  #let fg-color = grid-line-color

  #place(rect(
    width: 100%,
    height: 100%,
    fill: bg-color,
    stroke: none,
  ))

  #place(dx: grid-line-offset, dy: 0pt, rect(
    width: grid-line-width,
    height: 100%,
    fill: fg-color,
    stroke: none,
  ))

  #place(dx: 0pt, dy: grid-line-offset, rect(
    width: 100%,
    height: grid-line-width,
    fill: fg-color,
    stroke: none,
  ))
]

// -----------------------------------------------------------------------------
// Wave shape
// -----------------------------------------------------------------------------

#let sine-bottom-shape(
  width,
  height: 4cm,
  wave-amp: 8mm,
  cycles: 4,
  samples: 320,
  phase: 0,
  fill: black,
) = {
  let pi = calc.pi
  let base-y = height - wave-amp

  let wave = range(samples + 1).map(i => {
    let t = i / samples
    let x = t * width
    let y = base-y + calc.sin(phase + t * cycles * 2 * pi) * wave-amp
    (x, y)
  })

  let reversed-wave = range(wave.len()).map(i => {
    let j = wave.len() - 1 - i
    curve.line(wave.at(j))
  })

  curve(
    fill: fill,
    stroke: none,

    curve.move((0pt, 0pt)),
    curve.line((width, 0pt)),
    curve.line((width, wave.last().at(1))),
    ..reversed-wave,
    curve.close(),
  )
}

#let sine-bottom-panel-sharp-shadow(
  height: 1.25cm,
  wave-amp: 5mm,
  cycles: 5,
  samples: 320,
  phase: calc.pi / 2,
  fill: colored-grid,

  shadow-dy: 0.82mm,
  shadow-colors: wave-shadow-colors,
) = layout(size => {
  let width = size.width
  let shadow-count = shadow-colors.len()
  let extra-height = shadow-dy * shadow-count

  block(width: width, height: height + extra-height)[
    // Backmost to frontmost shadow layers.
    #for i in range(shadow-count) {
      place(dx: 0pt, dy: shadow-dy * (shadow-count - i))[
        #sine-bottom-shape(
          width,
          height: height,
          wave-amp: wave-amp,
          cycles: cycles,
          samples: samples,
          phase: phase,
          fill: shadow-colors.at(i),
        )
      ]
    }

    // Foreground panel.
    #place(dx: 0pt, dy: 0pt)[
      #sine-bottom-shape(
        width,
        height: height,
        wave-amp: wave-amp,
        cycles: cycles,
        samples: samples,
        phase: phase,
        fill: fill,
      )
    ]
  ]
})

// -----------------------------------------------------------------------------
// Main hero panel
// -----------------------------------------------------------------------------

#let hero-panel() = [
  #box(
    width: 100%,
    height: hero-panel-height,
    fill: colored-grid,
    inset: (x: page-margin.x, y: page-margin.y),

    // A heavy bottom rule makes the grid look broken even when aligned.
    // Keep it quiet, or remove this stroke entirely.
    stroke: (bottom: 1.25pt + grid-line-color),
  )[
    #set par(spacing: 10pt, leading: 10pt)

    #box[
      #set text(
        size: 12pt,
        font: "Avenir",
        fill: hero-title-color,
        weight: 200,
      )

      #grid(
        columns: (1fr, 1fr),
        column-gutter: 10pt,

        [
          #align(left)[
            Salt Lake City, Utah
          ]
        ],

        [
          #align(right)[
            TODO
          ]
        ],
      )
    ]

    #box(
      width: 100%,
      inset: (x: 10pt, y: 20pt),
      stroke: (
        top: hero-stroke,
        bottom: hero-stroke,
      ),
    )[
      #align(center)[
        #heading(level: 1)[
          #text(
            size: 40pt,
            font: "Playfair Display SC",
            fill: hero-title-color,
          )[
            Colbyn Wadman
          ]
        ]
      ]
    ]

    #grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      column-gutter: 0pt,

      [
        #pill-label[
          #text(fill: sine-panel-fg-color)[
            #link("https://colbyn.com")[colbyn.com]
          ]
        ]
      ],

      [
        #pill-label[
          #text(fill: sine-panel-fg-color)[
            #link("https://github.com/colbyn")[github.com/colbyn]
          ]
        ]
      ],

      [
        #pill-label[
          #text(fill: sine-panel-fg-color)[
            #link("tel:+18013674487")[801-367-4487]
          ]
        ]
      ],

      [
        #pill-label[
          #text(fill: sine-panel-fg-color)[
            #link("mailto:hello@colbyn.com")[hello\@colbyn.com]
          ]
        ]
      ],
    )
  ]
]

// -----------------------------------------------------------------------------
// Cover
// -----------------------------------------------------------------------------

#bleed-top(
  98pt,
  [
    #hero-panel()

    #sine-bottom-panel-sharp-shadow(
      height: 1.25cm,
      wave-amp: 4mm,
      cycles: 5,
      samples: 320,
      phase: calc.pi / 2,
      fill: colored-grid,
    )
  ],
)
