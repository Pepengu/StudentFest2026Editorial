#let ink = rgb("#003365")
#let muted = rgb("#ccd3dc")
#let orange = rgb("#db7600")

#let edge(a, b, color: ink, dashed: false, thick: 1.5pt) = place(top + left,
  line(start: (a.at(0)*1pt, a.at(1)*1pt), end: (b.at(0)*1pt, b.at(1)*1pt),
    stroke: (paint: color, thickness: thick, dash: if dashed {"dashed"} else {"solid"})))

#let node(x, y, label, fill: white, color: ink, radius: 11pt) = place(top + left,
  dx: x*1pt - radius, dy: y*1pt - radius,
  circle(radius: radius, fill: fill, stroke: color + 1.3pt,
    align(center + horizon, text(size: 11pt, fill: color, label))))

#let label(x, y, body) = place(top + left, dx: x*1pt, dy: y*1pt,
  text(size: 11pt, fill: ink, body))

#let secret-graph(after: false) = block(width: 210pt, height: 130pt)[
  #label(12, 0, [Ваня: $X$])
  #label(145, 0, [Даня: $Y$])
  #edge((30, 43), (175, 43), color: if after {muted} else {ink}, dashed: after)
  #edge((30, 116), (175, 116), color: if after {muted} else {ink}, dashed: after)
  #edge((30, 116), (175, 43), color: orange, thick: 3pt)
  #node(30, 43, $X_1$, fill: if after {rgb("#f1f3f6")} else {rgb("#fff0c9")}, color: if after {muted} else {ink})
  #node(175, 116, $Y_2$, fill: if after {rgb("#f1f3f6")} else {rgb("#fff0c9")}, color: if after {muted} else {ink})
  #node(30, 116, $X_2$, fill: rgb("#fff0dc"), color: orange)
  #node(175, 43, $Y_1$, fill: rgb("#fff0dc"), color: orange)
  #label(80, 94, [секрет])
]

#let compressed-tree(compressed: false) = block(width: 210pt, height: 151pt)[
  #if compressed {
    edge((90, 16), (15, 125), color: orange, thick: 2pt)
    edge((90, 16), (160, 78), color: orange, thick: 2pt)
    label(9, 66, $f compose g$)
    label(143, 35, $h$)
  } else {
    edge((90, 16), (45, 48))
    edge((45, 48), (25, 85))
    edge((25, 85), (15, 125))
    edge((90, 16), (140, 45))
    edge((140, 45), (160, 78))
    node(45, 48, $f$, fill: rgb("#d9f0f4"))
    node(25, 85, $g$, fill: rgb("#d9f0f4"))
    node(140, 45, $h$, fill: rgb("#d9f0f4"))
  }
  #edge((160, 78), (125, 125))
  #edge((160, 78), (195, 125))
  #node(90, 16, $u$, fill: rgb("#e3eaf4"))
  #node(160, 78, $v$, fill: rgb("#e3eaf4"))
  #node(15, 125, $c_1$)
  #node(125, 125, $c_2$)
  #node(195, 125, $c_3$)
]

#let schedule-graph() = block(width: 210pt, height: 145pt)[
  #edge((35, 42), (100, 42))
  #edge((100, 42), (165, 42))
  #edge((83, 37), (89, 42))
  #edge((83, 47), (89, 42))
  #edge((148, 37), (154, 42))
  #edge((148, 47), (154, 42))
  #node(35, 42, [1])
  #node(100, 42, [2])
  #node(165, 42, [3])
  #node(100, 108, [4], color: orange, fill: rgb("#fff0dc"))
  #label(53, 128, [Нет зависимостей])
]

#let schedule-days() = block(width: 210pt, height: 145pt)[
  #label(8, 0, [Дни:])
  #for (i, x) in (96, 137, 178).enumerate() {
    label(x - 3, 0, str(i + 1))
  }
  #for i in range(4) {
    let y = 36 + 28*i
    label(8, y - 6, [Работа #str(i + 1)])
    for (j, x) in (96, 137, 178).enumerate() {
      if i == 3 or i == j {
        node(x, y, [], radius: 7pt,
          color: if i == 3 {orange} else {ink},
          fill: if i == 3 {rgb("#fff0dc")} else {rgb("#e3eaf4")})
      } else {
        node(x, y, [], radius: 2pt, color: muted, fill: muted)
      }
    }
  }
]

#let diamond-coordinates(transformed: false) = block(width: 210pt, height: 170pt)[
  #edge((8, 82), (184, 82), color: muted)
  #edge((96, 162), (96, 3), color: muted)
  #label(184, 84, if transformed {$u$} else {$X$})
  #label(102, 0, if transformed {$v$} else {$Y$})
  #label(83, 88, [0])
  #if transformed {
    edge((32, 18), (160, 18), color: orange, thick: 2.5pt)
    edge((160, 18), (160, 146))
    edge((160, 146), (32, 146))
    edge((32, 146), (32, 18))
    label(37, 1, $v = x$)
    label(163, 129, $u = x$)
  } else {
    edge((96, 18), (160, 82), color: orange, thick: 2.5pt)
    edge((160, 82), (96, 146))
    edge((96, 146), (32, 82))
    edge((32, 82), (96, 18))
    label(129, 25, $X + Y = x$)
  }
  #let path = if transformed {((0,0), (1,1), (0,2), (1,3), (0,4))} else {((0,0), (1,0), (1,1), (2,1), (2,2))}
  #for i in range(1, path.len()) {
    let a = path.at(i - 1)
    let b = path.at(i)
    edge((96 + 16*a.at(0), 82 - 16*a.at(1)),
      (96 + 16*b.at(0), 82 - 16*b.at(1)), color: rgb("#0797a5"), thick: 2pt)
  }
  #let last = path.last()
  #node(96 + 16*last.at(0), 82 - 16*last.at(1), [], radius: 3.5pt, color: orange, fill: orange)
]
