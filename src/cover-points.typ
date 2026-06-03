#import "common.typ": bleed-top, bleed-x
// #import "cover-2.typ": ink


#let ink = rgb("#10131a")
#let hero-title-color = ink

#set par(spacing: 10pt, leading: 0pt)

#let capability-label-color = rgb("#535353")
#let capability-label-font = "Avenir"

#let capability-rail-width = 12pt
#let capability-gutter = 5pt
#let capability-outer-inset = 3pt
#let capability-inner-inset = 8pt
#let capability-stroke = 1.5pt

#let capability-label-body(label, accent: capability-label-color) = text(
  size: 12pt,
  font: capability-label-font,
  fill: accent,
  weight: 900,
)[
  #upper(label)
]

#let capability-label-box(label, height, accent: capability-label-color) = {
  let fade = 70%
  let body = capability-label-body(label, accent: accent.transparentize(fade))

  let inner-height = (
    height - capability-outer-inset * 2
  )

  let label-area-height = (
    height - capability-outer-inset * 2 - capability-inner-inset * 2
  )

  box(
    height: height,
    stroke: (capability-stroke + accent.transparentize(fade)),
    inset: capability-outer-inset,
  )[
    #box(
      height: inner-height,
      stroke: (capability-stroke + accent.transparentize(fade)),
      inset: capability-inner-inset,
    )[
      #box(
        width: capability-rail-width,
        height: label-area-height,
      )[
        #align(center + horizon)[
          #rotate(-90deg)[#body]
        ]
      ]
    ]
  ]
}

#let capability-row(label, body, accent: capability-label-color) = layout(size => {
  let rail-total-width = (
    capability-rail-width + capability-inner-inset * 2 + capability-outer-inset * 2
  )

  let content-width = (
    size.width - rail-total-width - capability-gutter
  )

  let label-body = capability-label-body(label, accent: accent)

  let left-height = (
    measure(label-body).width + capability-outer-inset * 2 + capability-inner-inset * 2 + 6pt
  )

  let right-content = box(
    width: content-width,
    inset: (y: 10pt),
  )[
    #body
  ]

  let right-height = measure(right-content).height

  let row-height = calc.max(left-height, right-height)

  grid(
    columns: (rail-total-width, 1fr),
    column-gutter: capability-gutter,
    align: top,
    capability-label-box(label, row-height, accent: accent),
    box(
      width: content-width,
      height: row-height,
      inset: (y: 9pt),
    )[
      #body
    ],
  )
})



#let capability-items(items, accent: hero-title-color, extra-body) = {
  set par(spacing: 10pt, justify: true)
  set align(left)

  grid(
    columns: (1fr,),
    column-gutter: 8pt,
    row-gutter: 8pt,
    ..items.map(item => [
      #block[
        #box(
          stroke: (
            top: 0.5pt + accent,
            bottom: 0.5pt + accent,
          ),
          inset: (x: 8pt, y: 8pt),
          width: 100%,
          [
            #align(left)[
              #text(weight: 600, fill: accent, font: "Avenir Next", size: 12pt)[#item.title]
            ]
          ]
        )
        #box(
          // stroke: 0.5pt + accent,
          inset: (x: 8pt, y: 8pt),
          width: 100%,
        )[
          // #v(2pt)
          #set text(size: 9.2pt, fill: ink, font: "Avenir Next", weight: 400)
          #set par(leading: 0.55em)
          #item.body

          #extra-body
        ]
      ]
    ])
  )
}

#let capability-tags(tags) = [
  #set par(leading: 5pt)
  #align(center)[
    #text(size: 8pt, fill: hero-title-color, weight: 500, font: "Avenir Next")[
      #tags.join("  ·  ")
    ]
  ]
]


#let software-section = [
  #let accent = rgb("#676563")
  #capability-row("Software", accent: accent)[
    #capability-items(
      accent: accent,
      (
        (
          title: [Lorem Ipsum Dollar Sum Import],
          body: [
            Bonbon cupcake cake sweet roll apple pie chocolate carrot cake bears bears. Tiramisu jujubes jujubes carrot cake candy canes tootsie roll sweet roll shortbread.
          ],
        ),
        (
          title: [Lorem Ipsum Dollar Sum Import],
          body: [
            Bonbon cupcake cake sweet roll apple pie chocolate carrot cake bears bears. Tiramisu jujubes jujubes carrot cake candy canes tootsie roll sweet roll shortbread.
          ],
        ),
      ),
    )[
      #capability-tags((
        "Application development",
        "Automation",
        "Data workflows",
        "Tool integration",
      ))
    ]

  ]
]


#let systems-section = [
  #let accent = rgb("#2828a9")
  #capability-row("Systemizing", accent: accent)[
    #capability-items(
      accent: accent,
      (
        (
          title: [Lorem Ipsum Dollar Sum Import],
          body: [
            Bonbon cupcake cake sweet roll apple pie chocolate carrot cake bears bears. Tiramisu jujubes jujubes carrot cake candy canes tootsie roll sweet roll shortbread.
          ],
        ),
        (
          title: [Lorem Ipsum Dollar Sum Import],
          body: [
            Bonbon cupcake cake sweet roll apple pie chocolate carrot cake bears bears. Tiramisu jujubes jujubes carrot cake candy canes tootsie roll sweet roll shortbread.
          ],
        ),
      ),
    )[
      #capability-tags((
        "Systems thinking",
        "Workflow design",
        "Technical architecture",
        "Reliable execution",
      ))
    ]

  ]
]

#let design-section = [
  #let accent = rgb("#7300ff")
  #capability-row("Design", accent: accent)[
    #capability-items(
      accent: accent,
      (
        (
          title: [Lorem Ipsum Dollar Sum Import],
          body: [
            Bonbon cupcake cake sweet roll apple pie chocolate carrot cake bears bears. Tiramisu jujubes jujubes carrot cake candy canes tootsie roll sweet roll shortbread.
          ],
        ),
        (
          title: [Lorem Ipsum Dollar Sum Import],
          body: [
            Bonbon cupcake cake sweet roll apple pie chocolate carrot cake bears bears. Tiramisu jujubes jujubes carrot cake candy canes tootsie roll sweet roll shortbread.
          ],
        ),
      ),
    )[
      #capability-tags((
        "Information design",
        "UX judgment",
        "Technical communication",
        "Document systems",
      ))
    ]

  ]
]

#let research-section = [
  #let accent = rgb("#ff00c8")
  #capability-row("Research", accent: accent)[
    #capability-items(
      accent: accent,
      (
        (
          title: [Lorem Ipsum Dollar Sum Import],
          body: [
            Bonbon cupcake cake sweet roll apple pie chocolate carrot cake bears bears. Tiramisu jujubes jujubes carrot cake candy canes tootsie roll sweet roll shortbread.
          ],
        ),
        (
          title: [Lorem Ipsum Dollar Sum Import],
          body: [
            Bonbon cupcake cake sweet roll apple pie chocolate carrot cake bears bears. Tiramisu jujubes jujubes carrot cake candy canes tootsie roll sweet roll shortbread.
          ],
        ),
      ),
    )[
      #capability-tags((
        "Technical research",
        "Lighting systems",
        "Power distribution",
        "Controls & optics",
      ))
    ]

  ]
]

#box(inset: 00pt)[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 40pt,
    row-gutter: 40pt,
    software-section,
    systems-section,
    design-section,
    research-section,
  )
]
