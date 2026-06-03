#import "common.typ": bleed-top, bleed-x

#set par(spacing: 0pt, leading: 0pt)

#let ink = rgb("#10131a")
#let hero-title-color = rgb("#444343")
#let hero-stroke = 0.8pt + hero-title-color

#let sine-panel-fg-color = rgb("#ffffff")
#let sine-panel-bg-color = rgb("#244e7d")
#let sine-panel-bg-shadow-colors = (
  sine-panel-bg-color.transparentize(75%),
  sine-panel-bg-color.transparentize(48%),
  sine-panel-bg-color.transparentize(8%),
)

#let pill-label(body) = [
  #set text(size: 13pt, weight: 300, font: "Avenir")
  #align(center)[
    #body
  ]
]

#let sine-bottom-panel(
  height: 4cm,
  wave-amp: 8mm,
  cycles: 4,
  samples: 320,
  phase: 0,
  fill: black,
) = layout(size => {
  let width = size.width
  let pi = calc.pi

  // Keep the lowest part of the wave inside the block.
  let base-y = height - wave-amp

  let wave = range(samples + 1).map(i => {
    let t = i / samples
    let x = t * width
    let y = base-y + calc.sin(phase + t * cycles * 2 * pi) * wave-amp
    (x, y)
  })

  // We draw clockwise:
  // top-left → top-right → bottom-right wave → wave back to left → close.
  let reversed-wave-lines = range(wave.len()).map(i => {
    let j = wave.len() - 1 - i
    curve.line(wave.at(j))
  })

  block(width: width, height: height)[
    #curve(
      fill: fill,
      stroke: none,

      curve.move((0pt, 0pt)),
      curve.line((width, 0pt)),
      curve.line(wave.last()),

      ..reversed-wave-lines,

      curve.close(),
    )
  ]
})

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

#let sine-bottom-panel-soft-shadow(
  height: 4cm,
  wave-amp: 8mm,
  cycles: 4,
  samples: 320,
  phase: 0,
  fill: rgb("#111111"),
) = layout(size => {
  let width = size.width

  block(width: width, height: height + 5mm)[
    #place(dx: 0pt, dy: 4.5mm)[
      #sine-bottom-shape(
        width,
        height: height,
        wave-amp: wave-amp,
        cycles: cycles,
        samples: samples,
        phase: phase,
        fill: rgb("#ddd7ce"),
      )
    ]

    #place(dx: 0pt, dy: 3mm)[
      #sine-bottom-shape(
        width,
        height: height,
        wave-amp: wave-amp,
        cycles: cycles,
        samples: samples,
        phase: phase,
        fill: rgb("#d2cbc1"),
      )
    ]

    #place(dx: 0pt, dy: 1.5mm)[
      #sine-bottom-shape(
        width,
        height: height,
        wave-amp: wave-amp,
        cycles: cycles,
        samples: samples,
        phase: phase,
        fill: rgb("#c8c0b6"),
      )
    ]

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

#let sine-bottom-panel-sharp-shadow(
  height: 4cm,
  wave-amp: 8mm,
  cycles: 4,
  samples: 320,
  phase: 0,
  fill: rgb("#111111"),

  shadow-dy: 0.9mm,
  shadow-colors: sine-panel-bg-shadow-colors,
) = layout(size => {
  let width = size.width
  let shadow-count = shadow-colors.len()
  let extra-height = shadow-dy * shadow-count

  block(width: width, height: height + extra-height)[
    // Backmost to frontmost shadow layers
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

    // Foreground panel
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

#let colored-grid = tiling(
  size: (20pt, 20pt),
  relative: "parent",
)[
  #let bg-color = sine-panel-bg-color
  #let fg-color = rgb("#363434a0")

  // Base color
  #place(rect(
    width: 100%,
    height: 100%,
    fill: bg-color,
    stroke: none,
  ))

  // Vertical line shifted inward inside each tile
  #place(dx: 15pt, dy: 0pt, rect(
    width: 0.5pt,
    height: 100%,
    fill: fg-color,
    stroke: none,
  ))

  // Horizontal line shifted inward inside each tile
  #place(dx: 0pt, dy: 15pt, rect(
    width: 100%,
    height: 0.5pt,
    fill: fg-color,
    stroke: none,
  ))
]


#bleed-top(
  120pt,
  // fill: red,
  [
    #box(fill: colored-grid, inset: 20pt, stroke: (bottom: 2pt + rgb("#242424")))[
      #set par(spacing: 10pt, leading: 10pt)
      // #let ink = rgb("#10131a")
      #let hero-title-color = sine-panel-fg-color
      #let hero-stroke = 0.8pt + hero-title-color

      #box[
        #set text(size: 12pt, font: "Avenir", fill: hero-title-color, weight: 200)

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
        stroke: (top: hero-stroke, bottom: hero-stroke),
        inset: (x: 10pt, y: 20pt),
        width: 100%,
        [
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
        ],
      )
      #grid(
        columns: (1fr, 1fr, 1fr, 1fr),
        [
          #pill-label[
            #text(fill: sine-panel-fg-color)[#link("https://colbyn.com")[colbyn.com]]
          ]
        ],
        [
          #pill-label[
            #text(fill: sine-panel-fg-color)[#link("https://github.com/colbyn")[github.com/colbyn]]
          ]
        ],
        [
          #pill-label[
            #text(fill: sine-panel-fg-color)[#link("tel:+18013674487")[801-367-4487]]
          ]
        ],
        [
          #pill-label[
            #text(fill: sine-panel-fg-color)[#link("mailto:hello@colbyn.com")[hello\@colbyn.com]]
          ]
        ],
      )
    ]
    #sine-bottom-panel-sharp-shadow(
      height: 1.25cm,
      wave-amp: 5mm,
      cycles: 5,
      phase: calc.pi / 2,
      fill: colored-grid,
    )
  ],
)



