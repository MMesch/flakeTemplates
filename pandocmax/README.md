---
title: Article Title
subtitle: ... and subtitle
classoption:
  - a4paper
  - 12pt
mainfont: DejaVu Serif
sansfont: DejaVu Sans
documentclass: scrartcl
author: The author name goes here
geometry: "left=4cm, right=3cm, top=2.5cm, bottom=2.5cm"
save_diagrams: true
numbersections: true
---

---
abstract: |

    Your abstract here 

---

# Intro {#sec:intro}

To use this template, open a new folder and type: `nix flake init -t github:mmesch/flakeTemplates#pandocmax`. Then type `nix build` to produce a PDF from `README.md` and edit the `flake.nix` to use other files. The template can already use citations [@nixosWebsite] and references to sections, e.g. to sec [@sec:intro], figures, etc ...

# Diagrams

## Plantuml

```{.plantuml filetype=png width=50% showcode=true}
@startuml
scale 400
!include <C4/C4_Container>

Person(personAlias, "Label", "Optional Description")
Container(containerAlias, "Label", "Technology", "Optional Description")
System(systemAlias, "Label", "Optional Description")

System_Ext(extSystemAlias, "Label", "Optional Description")

Rel(personAlias, containerAlias, "Label", "Optional Technology")

Rel_U(systemAlias, extSystemAlias, "Label", "Optional Technology")
@enduml
```
## Graphviz

``` {.graphviz}
digraph mygraph {
  fontname="Helvetica,Arial,sans-serif"
  node [fontname="Helvetica,Arial,sans-serif"]
  edge [fontname="Helvetica,Arial,sans-serif"]
  node [shape=box];
  "//absl/random:random"
  "//absl/random:random" -> "//absl/random:distributions"
  "//absl/random:random" -> "//absl/random:seed_sequences"
  "//absl/random:random" -> "//absl/random/internal:pool_urbg"
  "//absl/random:random" -> "//absl/random/internal:nonsecure_base"
  "//absl/random:distributions"
  "//absl/random:distributions" -> "//absl/strings:strings"
  "//absl/random:seed_sequences"
  "//absl/random:seed_sequences" -> "//absl/random/internal:seed_material"
  "//absl/random:seed_sequences" -> "//absl/random/internal:salted_seed_seq"
  "//absl/random:seed_sequences" -> "//absl/random/internal:pool_urbg"
  "//absl/random:seed_sequences" -> "//absl/random/internal:nonsecure_base"
  "//absl/random/internal:nonsecure_base"
  "//absl/random/internal:nonsecure_base" -> "//absl/random/internal:pool_urbg"
  "//absl/random/internal:nonsecure_base" -> "//absl/random/internal:salted_seed_seq"
  "//absl/random/internal:nonsecure_base" -> "//absl/random/internal:seed_material"
  "//absl/random/internal:pool_urbg"
  "//absl/random/internal:pool_urbg" -> "//absl/random/internal:seed_material"
  "//absl/random/internal:salted_seed_seq"
  "//absl/random/internal:salted_seed_seq" -> "//absl/random/internal:seed_material"
  "//absl/random/internal:seed_material"
  "//absl/random/internal:seed_material" -> "//absl/strings:strings"
  "//absl/strings:strings"
}
```
## Mermaid

```{.mermaid filetype=pdf}
flowchart LR
A[Hard] -->|Text| B(Round)
B --> C{Decision}
C -->|One| D[Result 1]
C -->|Two| E[Result 2]
```

## Vegalite

``` {.vegalite filetype=pdf extraOptions="-s0.25"}
{
  "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
  "description": "A simple bar chart with embedded data.",
  "data": {
    "values": [
      {"a": "A", "b": 28}, {"a": "B", "b": 55}, {"a": "C", "b": 43},
      {"a": "D", "b": 91}, {"a": "E", "b": 81}, {"a": "F", "b": 53},
      {"a": "G", "b": 19}, {"a": "H", "b": 87}, {"a": "I", "b": 52}
    ]
  },
  "mark": "bar",
  "encoding": {
    "x": {"field": "a", "type": "nominal", "axis": {"labelAngle": 0}},
    "y": {"field": "b", "type": "quantitative"}
  }
}
```

## Vega

``` {.vega filetype=pdf}
{
  "$schema": "https://vega.github.io/schema/vega/v5.json",
  "description": "A basic area chart example.",
  "width": 500,
  "height": 200,
  "padding": 5,

  "signals": [
    {
      "name": "interpolate",
      "value": "monotone",
      "bind": {
        "input": "select",
        "options": [
          "basis",
          "cardinal",
          "catmull-rom",
          "linear",
          "monotone",
          "natural",
          "step",
          "step-after",
          "step-before"
        ]
      }
    }
  ],

  "data": [
    {
      "name": "table",
      "values": [
        {"u": 1,  "v": 28}, {"u": 2,  "v": 55},
        {"u": 3,  "v": 43}, {"u": 4,  "v": 91},
        {"u": 5,  "v": 81}, {"u": 6,  "v": 53},
        {"u": 7,  "v": 19}, {"u": 8,  "v": 87},
        {"u": 9,  "v": 52}, {"u": 10, "v": 48},
        {"u": 11, "v": 24}, {"u": 12, "v": 49},
        {"u": 13, "v": 87}, {"u": 14, "v": 66},
        {"u": 15, "v": 17}, {"u": 16, "v": 27},
        {"u": 17, "v": 68}, {"u": 18, "v": 16},
        {"u": 19, "v": 49}, {"u": 20, "v": 15}
      ]
    }
  ],

  "scales": [
    {
      "name": "xscale",
      "type": "linear",
      "range": "width",
      "zero": false,
      "domain": {"data": "table", "field": "u"}
    },
    {
      "name": "yscale",
      "type": "linear",
      "range": "height",
      "nice": true,
      "zero": true,
      "domain": {"data": "table", "field": "v"}
    }
  ],

  "axes": [
    {"orient": "bottom", "scale": "xscale", "tickCount": 20},
    {"orient": "left", "scale": "yscale"}
  ],

  "marks": [
    {
      "type": "area",
      "from": {"data": "table"},
      "encode": {
        "enter": {
          "x": {"scale": "xscale", "field": "u"},
          "y": {"scale": "yscale", "field": "v"},
          "y2": {"scale": "yscale", "value": 0},
          "fill": {"value": "steelblue"}
        },
        "update": {
          "interpolate": {"signal": "interpolate"},
          "fillOpacity": {"value": 1}
        },
        "hover": {
          "fillOpacity": {"value": 0.5}
        }
      }
    }
  ]
}
```

## SVGBob


``` {.svgbob}
 o->  Quick logo scribbles
        .---.                      _
       /-o-/--       .--.         |-|               .--.
    .-/ / /->       /--. \     .--)-|    .--.-.    //.-.\
   ( *  \/         / O  )|     |  |-|    |->| |   (+(-*-))
    '-.  \        /\ |-//      .  * |    '--'-'    \\'-'/
       \ /        \ '+'/        \__/                '--'
        '          '--'
```

# References

---
references:
- id: nixosWebsite
  author: NixOS Community
  title: Main Website
  url: https://nixos.org
  type: online

---
