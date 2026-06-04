#import "common.typ": bleed-top, bleed-x
// #import "cover-2.typ": ink

#let ink = rgb("#10131a")
#let hero-title-color = ink

#set par(spacing: 6pt, leading: 6pt)

#let capability-label-color = rgb("#535353")
#let capability-label-font = "Avenir"

#let capability-rail-width = 11pt
#let capability-gutter = 5pt
#let capability-outer-inset = 2.5pt
#let capability-inner-inset = 6pt
#let capability-stroke = 1.2pt
#let deemphasize-fade = 80%

#let capability-label-body(label, accent: capability-label-color) = text(
  size: 10.5pt,
  font: capability-label-font,
  fill: accent,
  weight: 900,
)[
  #upper(label)
]

#let capability-label-box(label, height, accent: capability-label-color) = {
  let body = capability-label-body(label, accent: accent)

  let inner-height = (
    height - capability-outer-inset * 2
  )

  let label-area-height = (
    height - capability-outer-inset * 2 - capability-inner-inset * 2
  )

  box(
    height: height,
    stroke: (capability-stroke + accent),
    inset: capability-outer-inset,
  )[
    #box(
      height: inner-height,
      stroke: (capability-stroke + accent),
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

#let capability-row(label, body, accent: capability-label-color, deemphasize-fade: deemphasize-fade) = layout(size => {
  let rail-total-width = (
    capability-rail-width + capability-inner-inset * 2 + capability-outer-inset * 2
  )

  let content-width = (
    size.width - rail-total-width - capability-gutter
  )

  let label-body = capability-label-body(label, accent: accent)

  let left-height = (
    measure(label-body).width + capability-outer-inset * 2 + capability-inner-inset * 2 + 5pt
  )

  let right-content = box(
    width: content-width,
    inset: (y: 6pt),
  )[
    #body
  ]

  let right-height = measure(right-content).height
  let row-height = calc.max(left-height, right-height)

  grid(
    columns: (rail-total-width, 1fr),
    column-gutter: capability-gutter,
    align: top,
    capability-label-box(label, row-height, accent: accent.transparentize(deemphasize-fade)),
    box(
      width: content-width,
      height: row-height,
      inset: (y: 5pt),
    )[
      #body
    ],
  )
})

#let capability-items(items, accent: hero-title-color, extra-body) = {
  set par(spacing: 6pt, justify: true)
  set align(left)

  grid(
    columns: (1fr,),
    row-gutter: 5pt,
    ..items.map(item => [
      #block[
        #box(
          stroke: (
            top: 0.45pt + accent.transparentize(deemphasize-fade),
            bottom: 0.45pt + accent.transparentize(deemphasize-fade),
          ),
          inset: (x: 6pt, y: 5pt),
          width: 100%,
          [
            #align(left)[
              #text(weight: 700, fill: accent.transparentize(42%), font: "Avenir Next", size: 10.5pt)[#item.title]
            ]
          ]
        )
        #box(
          inset: (x: 6pt, y: 5pt),
          width: 100%,
        )[
          #set text(size: 8.45pt, fill: ink, font: "Avenir Next", weight: 400)
          #set par(leading: 0.52em)
          #item.body
          #extra-body
        ]
      ]
    ]),
  )
}

#let capability-tags(tags) = [
  #set par(leading: 4pt)
  #align(center)[
    #text(size: 7pt, fill: hero-title-color.transparentize(18%), weight: 600, font: "Avenir Next")[
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
          title: [Instrumented systems],
          body: [
            Crawlers, pipelines, search indexes, reporting layers. Built around the actual data model: queryable; auditable; extendable.
          ],
        ),
        (
          title: [Workflow automation],
          body: [
            Manual processes converted to defined pipelines: structured inputs, quality gates, clean handoffs.
          ],
        ),
      ),
    )[
      #capability-tags((
        "Automation",
        "Search",
        "Data Pipelines",
        "CLI",
        "Reporting",
      ))
    ]
  ]
]

#let systems-section = [
  #let accent = rgb("#2828a9")
  #capability-row("Systems", accent: accent)[
    #capability-items(
      accent: accent,
      (
        (
          title: [Architecture before components],
          body: [
            Topology, constraints, and failure modes defined first.
          ],
        ),
        (
          title: [Process formalization],
          body: [
            Informal rules surfaced, named, and documented.
          ],
        ),
      ),
    )[
      #capability-tags((
        "Topology",
        "Process Design",
        "Constraints",
        "Documentation",
        "Operations",
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
          title: [DC lighting architecture],
          body: [
            Distribution layout, driver selection, control protocol, dimming behavior, serviceability.
          ],
        ),
        (
          title: [Technical publication],
          body: [
            Specifications, diagrams, and installation logic precise enough to build from. (Clear enough to hand to a non-specialist without a walkthrough.)
          ],
        ),
      ),
    )[
      #capability-tags((
        "Low Voltage",
        "DC Distribution",
        "Typst",
        "Specification",
        "Diagrams",
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
          title: [Primary source analysis],
          body: [
            Datasheets, standards, supplier catalogs, field constraints. 
          ],
        ),
        (
          title: [Actionable synthesis],
          body: [
            Gap between specification and real installation conditions: identified, closed, documented.
          ],
        ),
      ),
    )[
      #capability-tags((
        "Standards",
        "Supply Chain",
        "Specs",
        "Field Constraints",
        "Technical Writing",
      ))
    ]
  ]
]

#let implementation-section = [
  #let accent = rgb("#00a6ff")
  #capability-row("Implementation", accent: accent)[
    #capability-items(
      accent: accent,
      (
        (
          title: [Full-cycle execution],
          body: [
            Layout, sourcing, commissioning, verification — without coordination loss from splitting phases across specialists who don't share a system model.
          ],
        ),
        (
          title: [Constraint-driven prototyping],
          body: [
            Early builds targeting the hard problem: thermal behavior, dimming continuity, distribution loss, control latency. Constraint solved before the system is committed.
          ],
        ),
      ),
    )[
      #capability-tags((
        "Installation",
        "Commissioning",
        "Prototyping",
        "Verification",
        "Low Voltage",
      ))
    ]
  ]
]

#let engagement-section = [
  #let accent = rgb("#00a6ff")
  #capability-row("Engagement", accent: accent)[
    #capability-items(
      accent: accent,
      (
        (
          title: [Where this applies],
          body: [
            Architecture undecided. Requirements rough. Existing system producing inconsistent results with no clear cause. That's the entry point.
          ],
        ),
        (
          title: [What it produces],
          body: [
            A system with a defensible logic — documented, sourceable, buildable, and maintainable by someone other than the original designer.
          ],
        ),
      ),
    )[
      #capability-tags((
        "Systems Thinking",
        "Ambiguity",
        "Technical Depth",
        "Documentation",
        "Handoffs",
      ))
    ]
  ]
]

#box(inset: 0pt)[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 24pt,
    row-gutter: 18pt,
    software-section,
    systems-section,
    design-section,
    research-section,
    implementation-section,
    engagement-section,
  )
]
