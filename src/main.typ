#import "common.typ": page-margin

#set document(
  title: "Colbyn's Resume",
  author: "Colbyn Wadman",
)

#set page(
  paper: "us-letter",
  margin: (
    x: page-margin.x,
    y: page-margin.y,
  ),
)

// #include "cover.typ"
#include "cover-2.typ"
#v(40pt)
#include "cover-points.typ"
#include "timeline.typ"
#include "freeform.typ"
#include "looking-ahead.typ"
// #include "lighting-example.typ"

