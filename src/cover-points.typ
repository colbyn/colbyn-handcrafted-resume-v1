// #import "common.typ": bleed-top, bleed-x
#import "cover-2.typ": hero-title-color, ink

#set par(spacing: 10pt, leading: 0pt)

#let capability-label-color = rgb("#535353")
#let capability-label-font = "Avenir"

#let capability-rail-width = 25pt
#let capability-gutter = 14pt
#let capability-outer-inset = 3pt
#let capability-inner-inset = 10pt
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
  let body = capability-label-body(label, accent: accent)

  let inner-height = (
    height - capability-outer-inset * 2
  )

  let label-area-height = (
    height - capability-outer-inset * 2 - capability-inner-inset * 2
  )

  box(
    height: height,
    stroke: capability-stroke + accent,
    inset: capability-outer-inset,
  )[
    #box(
      height: inner-height,
      stroke: capability-stroke + accent,
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
      inset: (y: 4pt),
    )[
      #body
    ],
  )
})



#let capability-items(items, accent: hero-title-color) = {
  set par(spacing: 6pt, justify: true)
  grid(
    columns: (1fr, 1fr),
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
          text(weight: 600, fill: accent, font: "Avenir Next", size: 12pt)[#item.title],
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
        ]
      ]
    ])
  )
}

#let capability-tags(tags) = {
  text(size: 8pt, fill: hero-title-color, weight: 500, font: "Avenir Next")[
    #tags.join("  ·  ")
  ]
}


#[
  #let accent = rgb("#676563")
  #capability-row("Software", accent: accent)[
    #capability-items(accent: accent, (
      (
        title: [Application development],
        body: [
          Build practical software for real workflows: internal tools, desktop
          utilities, automation scripts, data interfaces, and custom systems that
          solve concrete problems.
        ],
      ),
      (
        title: [Data & automation],
        body: [
          Turn repetitive, manual, or messy processes into structured workflows
          that collect, transform, validate, and move information reliably.
        ],
      ),
      (
        title: [Search & organization],
        body: [
          Create tools that make information easier to find, filter, compare,
          inspect, and act on across records, documents, files, and datasets.
        ],
      ),
      (
        title: [Integration work],
        body: [
          Connect formats, tools, scripts, APIs, databases, and documents into
          workflows that feel coherent instead of patched together.
        ],
      ),
    ))

    #capability-tags((
      "Application development",
      "Automation",
      "Data workflows",
      "Tool integration",
    ))
  ]
]


#[
  #let accent = rgb("#2828a9")
  #capability-row("Systems", accent: accent)[
    #capability-items(
      accent: accent,
      (
        (
          title: [Problem decomposition],
          body: [
            Break ambiguous problems into clear models, sensible boundaries,
            testable pieces, and workflows that can actually be built.
          ],
        ),
        (
          title: [Operational thinking],
          body: [
            Design systems around reliability, recoverability, inspection,
            repeatability, and the ordinary messiness of real-world inputs.
          ],
        ),
        (
          title: [Technical architecture],
          body: [
            Structure projects so data, logic, interfaces, configuration, and
            outputs stay understandable as the work grows.
          ],
        ),
        (
          title: [Practical execution],
          body: [
            Move from idea to working implementation quickly while preserving the
            details that make a system usable, maintainable, and adaptable.
          ],
        ),
      ),
    )

    #capability-tags((
      "Systems thinking",
      "Workflow design",
      "Technical architecture",
      "Reliable execution",
    ))
  ]
]

#[
  #let accent = rgb("#7300ff")
  #capability-row("Design", accent: accent)[
    #capability-items(
      accent: accent,
      (
        (
          title: [Information design],
          body: [
            Make complex material easier to understand through structure,
            hierarchy, comparison, sequencing, layout, and clear visual emphasis.
          ],
        ),
        (
          title: [User-centered tools],
          body: [
            Shape interfaces around how people actually inspect, decide, edit,
            search, review, and complete work under time pressure.
          ],
        ),
        (
          title: [Communication systems],
          body: [
            Create documents, reports, diagrams, templates, and presentation
            formats that make technical work easier to explain and reuse.
          ],
        ),
        (
          title: [Taste & clarity],
          body: [
            Bring editorial judgment to technical work so the result is not just
            functional, but readable, navigable, and credible.
          ],
        ),
      ),
    )

    #capability-tags((
      "Information design",
      "UX judgment",
      "Technical communication",
      "Document systems",
    ))
  ]
]











#let research-item(title, body, details: ()) = block[
  #set text(size: 9.2pt, spacing: 0pt)
  #text(weight: 850, fill: hero-title-color)[#title]
  #v(2pt)
  #block[
    #set par(leading: 0.62em)
    #body
  ]

  #if details.len() > 0 [
    #v(5pt)
    #text(size: 8pt, fill: hero-title-color, weight: 700)[
      #details.join("  ·  ")
    ]
  ]
]

#[
  #let accent = rgb("#ff00c8")
  #capability-row("Research", accent: accent)[
    #capability-items(
      accent: accent,
      (
        (
          title: [Low-voltage lighting],
          body: [
            Researched architectural lighting systems built around centralized
            low-voltage DC power, distributed controls, LED fixtures, and cabinet-
            based infrastructure.
          ],
        ),
        (
          title: [Power architecture],
          body: [
            Mapped how power supplies, Class 2 limits, distribution modules,
            wiring patterns, connectors, backup paths, and service boundaries
            shape the overall system.
          ],
        ),
        (
          title: [Control behavior],
          body: [
            Compared driver topologies, dimming methods, switch-level controls,
            tunable white behavior, addressing models, flicker risk, and low-end
            performance.
          ],
        ),
        (
          title: [Optical performance],
          body: [
            Studied how LEDs, lenses, reflectors, diffusers, louvers, beam angles,
            source size, glare, and surface luminance determine visual comfort
            and perceived quality.
          ],
        ),
      ),
    )

    #capability-tags((
      "Technical research",
      "Lighting systems",
      "Power distribution",
      "Controls & optics",
    ))
  ]

]
