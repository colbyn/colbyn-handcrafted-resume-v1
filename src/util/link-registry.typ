// link-registry.typ

#let link-state = state("link-registry.namespaces", (:))

#let link-blue = rgb("#1d5fd1")
#let link-muted = rgb("#686c74")
#let link-rule = rgb("#d9dbe2")
#let link-ink = rgb("#22252b")

#let sanitize-url(url) = {
  str(url)
    .replace(" ", "%20")
    .replace("®", "%C2%AE")
    .replace("™", "%E2%84%A2")
}

#let link-counter(ns) = counter("link-registry.counter." + ns)

#let register-link(url, ns: "main") = {
  let clean = sanitize-url(url)

  link-state.update(all => {
    let entries = all.at(ns, default: ())
    entries.push(clean)
    all.insert(ns, entries)
    all
  })
}

#let link-mark(n) = super(n, typographic: false)

#let link-shell(body, style: "text") = {
  if style == "button" {
    box(
      stroke: 0.35pt + link-blue,
      radius: 2pt,
      inset: (x: 5pt, y: 2.5pt),
    )[
      #text(size: 8.5pt, weight: 450, fill: link-blue)[#body]
    ]
  } else if style == "plain" {
    body
  } else {
    text(fill: link-blue)[#body]
  }
}

#let doc-link(
  url,
  ns: "main",
  mark: true,
  style: "text",
  body,
) = [
  #let clean = sanitize-url(url)
  #link-counter(ns).step()
  #register-link(clean, ns: ns)

  #link(clean)[
    #link-shell(style: style)[
      #body
      #if mark [
        #context {
          link-mark(link-counter(ns).display())
        }
      ]
    ]
  ]
]

#let print-link-row(number, url) = [
  #grid(
    columns: (auto, 1fr),
    column-gutter: 8pt,
    align: top,
  )[
    #text(size: 7.5pt, weight: 500, fill: link-muted)[#number]
  ][
    #text(size: 7.5pt, fill: link-ink)[
      #link(url)[#url]
    ]
  ]
]

#let print-links(
  ns: "main",
  title: [Links],
  empty: none,
  compact: false,
) = context {
  let entries = link-state.get().at(ns, default: ())

  if entries.len() == 0 {
    empty
  } else {
    let top-space = if compact { 6pt } else { 10pt }
    let row-gap = if compact { 2pt } else { 3pt }

    [
      #v(top-space)
      #line(length: 100%, stroke: 0.35pt + link-rule)
      #v(4pt)

      #text(size: 9pt, weight: 600, fill: link-muted)[#title]

      #v(4pt)

      #for i in range(entries.len()) [
        #print-link-row(str(i + 1), entries.at(i))
        #v(row-gap)
      ]
    ]
  }
}
