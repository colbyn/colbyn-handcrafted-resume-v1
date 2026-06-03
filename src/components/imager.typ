#let filesize-bars = (
  (label: "source", value: 39.00, note: "39.00M (4 images)"),
  (label: "kraken.io", value: 24.00, note: "24M"),
  (label: "jpegmini.com", value: 16.00, note: "16M"),
  (label: "compression.ai", value: 8.90, note: "8.90M"),
  (label: "imager", value: 4.20, note: "4.20M"),
)

#let bar-chart(
  data,
  max-value: none,
  bar-height: 1.0em,
  gap: 0.38em,
  fill: rgb("#2f3437"),
  text-fill: rgb("#202326"),
  font: "Avenir Next",
  mono-font: "Menlo",
) = {
  let font-size = 10pt
  let max-v = if max-value == none {
    calc.max(..data.map(row => row.value))
  } else {
    max-value
  }

  grid(
    columns: (auto, auto, 1fr, auto),
    column-gutter: 0.32em,
    row-gutter: gap,

    ..data.map(row => {
      let ratio = row.value / max-v

      (
        align(right + horizon)[
          #text(size: font-size, fill: text-fill, font: font)[
            #row.label
          ]
        ],

        align(right + horizon)[
          #text(size: font-size, fill: text-fill, font: mono-font)[:]
        ],

        box(width: 100%, height: bar-height)[
          #box(
            width: ratio * 100%,
            height: bar-height,
            fill: fill,
            radius: 0.7pt,
          )
        ],

        align(right + horizon)[
          #text(size: font-size, fill: text-fill, font: font)[
            #row.note
          ]
        ],
      )
    }).flatten()
  )
}

#bar-chart(filesize-bars)

#let imager-sizing-chart = [
  #bar-chart(filesize-bars)
]

