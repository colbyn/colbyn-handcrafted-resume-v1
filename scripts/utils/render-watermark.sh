#!/usr/bin/env bash
set -euo pipefail

mkdir -p assets

cat > /tmp/watermark.typ <<'EOF'
#set page(
  width: 11in,
  height: 8.5in,
  margin: 0pt,
  fill: none,
)

#set par(justify: false)

#place(
  center + horizon,
  rotate(35deg)[
    #text(
      size: 100pt,
      fill: rgb("#000000").transparentize(80%),
      weight: 900,
      stretch: 200%,
      tracking: 10pt,
      font: "Avenir Next",
    )[NOT FOR\ HUMANS]
  ],
)
EOF

typst compile /tmp/watermark.typ assets/watermark.png --ppi 600
rm /tmp/watermark.typ

echo "Created assets/watermark.png"