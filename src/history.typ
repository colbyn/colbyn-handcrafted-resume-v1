#import "common.typ": page-kicker, label-font, ink, bleed-x
#import "cover-points.typ": capability-row
#import "components/imager.typ": imager-sizing-chart
#import "util/link-registry.typ": doc-link as base-doc-link, print-links as base-print-links

#let link-namespace = "overview"

#let doc-link(ns: link-namespace, ..args) = base-doc-link(..args, ns: ns)
#let print-links(ns: link-namespace, ..args) = base-print-links(..args, ns: ns)

#set text(font: label-font, size: 10.0pt, fill: ink )
#set par(spacing: 6pt, leading: 8pt)

#let entry(kicker, title, body) = [
  #page-kicker(kicker)
  #box()[
    #heading(level: 2)[#title]
    #body
  ]
]

#let overview-items = (
  entry("Milestone")[2019][
    Top-percentile GitHub contributor
    #doc-link(
      "https://github.com/colbyn?tab=overview&from=2019-12-01&to=2019-12-31",
      ns: link-namespace,
    )[Source]
  ],
  entry("Achievement")[728+ ⭐️][
    GitHub stars on most popular authored OSS tool
    #doc-link("https://github.com/imager-io/imager")[Source]
  ],
  entry("Highlight")[Imager][
    Rust / Node image optimization algorithm using brute force heuristics
    #doc-link("https://github.com/imager-io/imager")[Source]
    #imager-sizing-chart
  ],
  entry("Review")[Academic][
    #let attribution = [
      Dr. Jim Birrell \ #doc-link("https://github.com/colbyn/analog-computing-and-refs")[Research Project]
    ]
    #quote(block: true, quotes: true, attribution: attribution)[You are such a profound writer and thinker. It has been my privilege to be your instructor of record. One day I will say, I had him in my English class. I have such high hopes for you! Go conquer your world! You're awesome.]
  ]
)

#let work-items = (
  entry("pre 2015")[Space Monkey][
    Brief High School Internship\
    Worked under Tom Metge
  ],
  entry("2015")[Galileo Processing][
    Galileo Processing\
    Worked under Robert Raver.
  ],
  entry("2016")[Uplynk / Verizon Digital Media Services][
    Worked as a Jr. Developer on the QA team.\
    Team lead: Asiel Brumfield.\
    Left to work on encrypted images.
  ],
  entry("2020")[2020 — UVU CS Grader][
    Utah Valley University\
    CS Grader — Computer Science\
    Bianca Ruiz
  ]
)

#let section-grid(title, body) = [
  #let color = rgb("#9a5ab7")
  #let border-color = rgb("#b15ac2")
  #page-kicker(title, accent: color, line-color: border-color)
  #box(
    stroke: ( left: 0.82pt + border-color ),
    inset: (10pt),
    [
      #body
    ],
  )
]


#section-grid("Features")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    ..overview-items
  )
]

#section-grid("Early Career History")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    ..work-items
  )
]



#print-links(ns: link-namespace, title: [Overview links])

#bleed-x[
  #image("../assets/SubscriptScreenshot.png")
]
