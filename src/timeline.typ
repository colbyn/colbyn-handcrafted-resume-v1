/*
  SELECTED PROJECTS & TECHNICAL HISTORY

  Editorial job:
  - Do not present the history as a damaged chronological resume.
  - Present it as a selected technical record: compilers, publishing systems,
    native editors, data pipelines, image optimization, QA tooling, and operations.
  - Let the section prove the pattern through artifacts. Avoid manifesto copy.
  - Preserve public links directly in the section. This is a publication-quality
    resume section, not a one-page ATS slab.

  Visual direction:
  - Light printable scheme.
  - White canvas. No cream paper. No dark hero blocks.
  - Mostly monochrome with two vivid accents.
  - Blue = structure / systems.
  - Coral = public signal / source / adoption.
  - The handmade feeling comes from editorial composition, marginal notes,
    thin rules, evidence labels, and uneven artifact rhythm, not from rainbow UI.
*/

#let ink = rgb("#10131a")
#let deep = rgb("#1f2937")
#let muted = rgb("#5b6472")
#let soft-muted = rgb("#7a8493")
#let paper = rgb("#ffffff")
#let soft = rgb("#f6f8fb")
#let line-soft = rgb("#dbe3ef")
#let line-dark = rgb("#9aa6b8")

#let wash-blue = rgb("#f4f8ff")
#let wash-coral = rgb("#fff7ed")
#let wash-gray = rgb("#f7f8fa")

#let electric = rgb("#2563eb")
#let coral = rgb("#f97316")
#let graphite = rgb("#374151")

#let accent = electric
#let hot = coral

#let page-margin = (
  x: 0.42in,
  y: 0.42in,
)

#set page(
  paper: "us-letter",
  margin: (x: page-margin.x, y: page-margin.y),
  fill: paper,
)

#set text(
  font: "Avenir Next",
  size: 8.7pt,
  fill: ink,
)

#set par(
  leading: 0.58em,
)

#show link: it => text(fill: hot, weight: "semibold", underline(it))

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

#let aside-section(heading, body) = [
  #box(
    inset: (left: 10pt, top: 10pt, bottom: 10pt),
    stroke: (
      left: 0.5pt + red
    ),
  )[
    #set par(leading: 10pt, spacing: 0pt, justify: false)
    #text(
      size: 20pt,
      weight: 500,
      // fill: rgb("#ff0000"),
      fill: rgb("#ff0000"),
    )[
      #heading
    ]
    #v(12pt)
    #body
  ]
]

#let rule(stroke: 0.6pt + line-soft) = line(length: 100%, stroke: stroke)

#let label(body, fill: accent) = text(
  size: 6.35pt,
  tracking: 0.95pt,
  fill: fill,
  weight: "bold",
  body,
)

#let small(body, fill: soft-muted) = text(
  size: 6.2pt,
  tracking: 0.65pt,
  fill: fill,
  body,
)

#let page-kicker(body, accent: electric) = block(width: 100%)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 8pt,
    align: horizon,
    [#label(body, fill: accent)],
    [#line(length: 100%, stroke: 0.55pt + line-soft)],
  )
]

#let quiet-tags(items) = {
  for pair in items.enumerate() {
    let i = pair.first()
    let item = pair.last()
    text(size: 6.35pt, fill: soft-muted, weight: "medium", item)
    if i < items.len() - 1 [
      #h(3pt)
      #text(size: 6.35pt, fill: line-dark)[·]
      #h(3pt)
    ]
  }
}

#let rail-box(
  body,
  color: electric,
  wash: wash-blue,
  inset: 8pt,
  radius: 3pt,
) = box(
  width: 100%,
  inset: inset,
  stroke: (
    left: 2.4pt + color,
    top: 0.55pt + line-soft,
    right: 0.55pt + line-soft,
    bottom: 0.55pt + line-soft,
  ),
  fill: wash,
  radius: radius,
)[
  #body
]

#let stat(kicker, value, body, color: electric, wash: wash-blue) = rail-box(
  color: color,
  wash: wash,
  inset: 8pt,
)[
  #label(kicker, fill: color)
  #v(2pt)
  #text(size: 20pt, weight: "black", fill: deep, value)
  #v(2pt)
  #text(size: 7.15pt, fill: muted, body)
]

#let note-card(title, body, color: electric, wash: wash-blue) = rail-box(
  color: color,
  wash: wash,
  inset: 9pt,
  radius: 4pt,
)[
  #label(title, fill: color)
  #v(4pt)
  #text(size: 8pt, fill: ink, body)
]

#let project-card(
  year,
  title,
  kind,
  body,
  tags: (),
  url: none,
  note: none,
  color: electric,
) = block(width: 100%)[
  #grid(
    columns: (1fr),
    [
      #page-kicker(year, accent: color)
      #box(
        width: 100%,
        inset: (left: 9pt, right: 0pt, top: 8pt, bottom: 8pt),
        stroke: (left: 1.6pt + color),
      )[
        #text(size: 10.4pt, weight: "black", fill: ink, title)
        #h(4pt)
        #text(size: 6.2pt, tracking: 0.7pt, fill: color, weight: "bold", kind)
        #v(4pt)

        #text(size: 7.8pt, fill: ink, body)

        #if note != none [
          #v(5pt)
          #box(
            inset: (x: 6pt, y: 4pt),
            fill: wash-gray,
            stroke: 0.45pt + line-soft,
            radius: 2pt,
          )[
            #text(size: 6.9pt, fill: deep, note)
          ]
        ]

        #if tags.len() > 0 [
          #v(5pt)
          #quiet-tags(tags)
        ]

        #if url != none [
          #v(5pt)
          #text(size: 6.9pt, weight: "semibold")[#link(url)[source ↗]]
        ]
      ]
    ],
  )
]

#let capability(title, body, evidence, color: graphite, wash: wash-gray) = box(
  width: 100%,
  inset: 0pt,
  stroke: 0.55pt + line-soft,
  fill: white,
  radius: 3pt,
)[
  #box(
    width: 100%,
    inset: (x: 8pt, y: 3.5pt),
    fill: wash,
    stroke: (bottom: 0.45pt + line-soft),
  )[
    #label(title, fill: color)
  ]

  #box(
    inset: 8pt,
    stroke: (left: 1.8pt + color),
  )[
    #text(size: 8pt, fill: ink, body)
    #v(5pt)
    #text(size: 6.8pt, fill: muted, evidence)
  ]
]

#let quoted-note(body, byline) = box(
  width: 100%,
  inset: (x: 10pt, y: 8pt),
  stroke: (
    left: 2pt + coral,
    top: 0.55pt + line-soft,
    right: 0.55pt + line-soft,
    bottom: 0.55pt + line-soft,
  ),
  fill: white,
  radius: 3pt,
)[
  #text(size: 10.5pt, font: "Hoefler Text", fill: deep, body)
  #v(5pt)
  #small(byline, fill: coral)
]

#let throughline-card() = note-card(
  "THROUGH-LINE",
  [
    The work keeps returning to the same problem: take loose material,
    impose structure, preserve meaning, and make the result usable.
  ],
  color: electric,
  wash: wash-blue,
)

#let section-title() = [
  #grid(
    columns: (1.28fr, 0.78fr),
    gutter: 18pt,
    [
      #page-kicker([SELECTED PROJECTS & TECHNICAL HISTORY], accent: electric)

      #v(7pt)

      #text(size: 30pt, font: "Hoefler Text", weight: "regular", fill: ink)[
        Systems built from messy material.
      ]

      #v(6pt)

      #text(size: 9pt, fill: muted)[
        A technical record across compilers, publishing tools, native editors,
        data pipelines, image optimization, QA tooling, and operations.
        The history is uneven. The work is not.
      ]
    ],
    [
      #throughline-card()
    ],
  )
  #v(10pt)
  #rule()
]

#let evidence-grid() = [
  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 7pt,

    stat(
      "2019 PUBLIC WORK",
      "1,323",
      "Recorded GitHub contributions across independent open-source projects.",
      color: electric,
      wash: wash-blue,
    ),

    stat(
      "OPEN SOURCE ADOPTION",
      "688",
      "Stars recorded for Imager in the archived source snapshot.",
      color: coral,
      wash: wash-coral,
    ),

    stat(
      "CURRENT HARD PROBLEM",
      "TextKit2",
      "Native Markdown rendering with real selection behavior across tables and block structure.",
      color: graphite,
      wash: wash-gray,
    ),
  )
]

#let foundation-strip() = [
  #v(10pt)
  #rule()
  #v(8pt)

  #label("EARLY FOUNDATION", fill: graphite)
  #v(5pt)

  #grid(
    columns: (1fr),
    gutter: 7pt,

    [
      #text(size: 8pt)[
        #text(weight: "bold")[Operations:] datacenter hardware, cabling, basic networking,
        installation, incident follow-through, and reliability work.
      ]
      #v(3pt)
      #small("Galileo Processing · Data Center Tech · 2015")
    ],

    [
      #text(size: 8pt)[
        #text(weight: "bold")[QA / release tooling:] Python scripts, debugging,
        issue reproduction, release support, and video delivery workflows.
      ]
      #v(3pt)
      #small("Uplynk / Verizon Digital Media Services · Jr. Developer · 2016")
    ],

    [
      #text(size: 8pt)[
        #text(weight: "bold")[Recognition:] UVU faculty praised writing/thinking;
        CS instructor offered a grading role after strong CS1400 performance.
      ]
      #v(3pt)
      #small("UVU · writing recognition + CS grader · 2020")
    ],
  )
]

#let systems-spine() = [
  #grid(
    columns: (0.74fr, 1.35fr),
    gutter: 16pt,

    [
      #rail-box(
        color: electric,
        wash: wash-blue,
        inset: 9pt,
        radius: 4pt,
      )[
        #label("THE RECORD IN ONE SENTENCE", fill: electric)

        #v(4pt)

        #text(size: 13pt, font: "Hoefler Text", fill: deep)[
          I turn messy information into structured, usable systems.
        ]
      ]

      #v(9pt)
      #rule()
      #v(8pt)

      #capability(
        "Language & transforms",
        "Parsers, DSLs, typed IRs, AST tools, static compilation, markup experiments.",
        "SubSys Compiler · commands · punk-lang · MonadoParser · pretty-tree-rs · SwiftPrettyTree",
        color: graphite,
        wash: wash-gray,
      )

      #v(6pt)

      #capability(
        "Documents & publishing",
        "LaTeX-inspired web publishing, math notes, semantic HTML, native authoring, durable document models.",
        "Subscript HTML · My Beautiful Math Notes · Subscript app · WebCompiler",
        color: electric,
        wash: wash-blue,
      )

      #v(6pt)

      #capability(
        "Native editors",
        "Low-level rendering, digital ink, Markdown selection, TextKit2, vector graphics, table editing.",
        "Subscript Freeform · SuperSwiftMarkdownPrototype",
        color: graphite,
        wash: wash-gray,
      )

      #v(6pt)

      #capability(
        "Data & workflow",
        "Schema-driven generation, validation, spreadsheet hygiene, checklists, release support, operational follow-through.",
        "3in1Spanish · Uplynk QA tooling · Galileo datacenter operations",
        color: coral,
        wash: wash-coral,
      )

      #v(8pt)

      #quoted-note(
        [“You are such a profound writer and thinker. It has been my privilege to be your instructor of record. One day I will say, I had him in my English class. I have such high hopes for you! Go conquer your world! You're awesome.”],
        [Dr. Jim Birrell, UVU faculty recognition]
      )

      #foundation-strip()
    ],

    [
      #project-card(
        "2018",
        "SubSys / Compiler",
        "Elm → Rust compiler prototype implemented in Haskell",
        [
          Built a cross-language compiler experiment around typed intermediate representation,
          constraint-based type inference/checking, parsing, transform stages, and semantic
          fidelity. Early signal: language design, correctness pressure, and structure-preserving
          translation.
        ],
        tags: ("Haskell", "Elm", "Rust", "typed IR", "compiler design"),
        url: "https://github.com/SubSys/Compiler",
        color: graphite,
      )

      #v(6pt)

      #project-card(
        "2019",
        "Imager",
        "Rust image optimization platform with Node integration",
        [
          Built a CLI-first image optimization toolchain with a Rust core, Node.js bindings,
          native media bindings, benchmark concerns, reproducible workflows, and build-pipeline
          integration. The supplied archive records a claimed 90%+ file-size reduction benchmark
          and a later 688-star public metric.
        ],
        tags: ("Rust", "Node.js", "FFmpeg", "VMAF", "WebP", "performance"),
        url: "https://github.com/imager-io",
        note: [Public archive; benchmark-oriented toolchain; later snapshot recorded 688 stars.],
        color: coral,
      )

      #v(6pt)

      #project-card(
        "2020",
        "Subscript Publishing System",
        "LaTeX-inspired publishing for web-native STEM notes",
        [
          Built a structured publishing toolchain for long-form technical notes: semantic HTML,
          navigation, tables of contents, linked headings, responsive reading, equations,
          diagrams, and mixed typed/freeform authoring experiments.
        ],
        tags: ("HTML", "JavaScript", "LaTeX-inspired", "technical writing", "publishing"),
        url: "https://github.com/subscript-publishing/subscript-html",
        color: electric,
      )

      #v(6pt)

      #project-card(
        "2023",
        "Subscript Freeform",
        "Vector note-taking app for iOS/macOS",
        [
          Built a handwritten, vector-based note-taking app from scratch with a durable document
          model, device-independent rendering space, velocity-aware stroke smoothing, semantic
          H1-H6 outlines, navigation, and table-of-contents generation.
        ],
        tags: ("Swift", "iOS", "macOS", "digital ink", "document model"),
        url: "https://github.com/subscript-publishing/subscript",
        color: graphite,
      )

      #v(6pt)

      #project-card(
        "2024",
        "Parser & Tree Visualization Toolkit",
        "Swift/Rust language-tooling libraries",
        [
          Built parser combinator and tree-rendering tools for inspecting ASTs and nested
          structures. The cluster includes MonadoParser, pretty-tree-rs, and SwiftPrettyTree:
          small tools for debugging, REPLs, test harnesses, and language-toolchain work.
        ],
        tags: ("Swift", "Rust", "parser combinators", "AST", "debugging"),
        url: "https://github.com/colbyn/MonadoParser",
        color: graphite,
      )

      #v(6pt)

      #project-card(
        "2024",
        "3in1Spanish Dataset Generator",
        "LLM-assisted compiler-generator for app data",
        [
          Built the dataset generation pipeline for a Spanish dictionary, phrasebook, and
          flash-card app. Modeled entries, phrases, study artifacts, validation, retries,
          and deterministic app-ready output.
        ],
        tags: ("data pipelines", "schema design", "LLM workflows", "validation"),
        url: "https://youtu.be/nofJLw51xSk?si=WrOwCT7WA6_VTBrO",
        color: coral,
      )

      #v(6pt)

      #project-card(
        "2025",
        "SuperSwiftMarkdownPrototype",
        "Native TextKit2 Markdown renderer",
        [
          Built a proof-of-concept Markdown renderer around Apple's low-level TextKit2 layout
          and rendering framework. The hard problem was not “display Markdown”; it was rich,
          native-feeling text selection across GitHub-Flavored Markdown blocks, including
          multi-cursor selection across and within tables.
        ],
        tags: ("Swift", "TextKit2", "Markdown", "native editors", "selection"),
        url: "https://github.com/SuperSwiftMarkup/SuperSwiftMarkdownPrototype",
        note: [Personally identified as the most technically challenging recent project.],
        color: electric,
      )
    ],
  )
]


#section-title()
#v(8pt)
#evidence-grid()
#v(12pt)
#systems-spine()

#pagebreak()

