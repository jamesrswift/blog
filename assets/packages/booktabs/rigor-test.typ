#import "lib.typ" as booktabs

#import "@preview/typpuccino:0.1.0"
#let bg-fill-1 = typpuccino.latte.base
#let bg-fill-2 = typpuccino.latte.mantle

#set text(size: 11pt)

#show link: box.with(stroke:red)

#let data = (
  (
    date: datetime.today(),
    particulars: lorem(05),
    ledger: [JRS123] + booktabs.footnotes.make[Hello World],
    amount: (unit: $100$, decimal: $00$),
    total: (unit: $99$, decimal: $00$),
  ),
)*7 


#let example = (
  (
    key: "date",
    header: align(left)[Date],
    display: (it)=>it.display(auto),
    fill: bg-fill-1,
    align: start,
    gutter: 0.5em,
  ),
  (
    key: "particulars",
    header: text(tracking: 5pt)[Particulars],
    width: 1fr,
    gutter: 0.5em,
  ),
  (
    key: "ledger",
    header: [Ledger],
    fill: bg-fill-2,
    width: 2cm,
    gutter: 0.5em,
  ),
  (
    header: align(center)[Amount],
    fill: bg-fill-1,
    gutter: 0.5em,
    hline: arguments(stroke: booktabs.lightrule),
    children: (
      (
        key: "amount.unit", 
        header: align(left)[£], 
        width: 5em, 
        align: right,
        vline: arguments(stroke: booktabs.lightrule),
        gutter: 0em,
      ),
      (
        key: "amount.decimal",
        header: align(right, text(number-type: "old-style")[.00]), 
        align: left
      ),
    )
  ),
  (
    header: align(center)[Total],
    gutter: 0.5em,
    hline: arguments(stroke: booktabs.lightrule),
    children: (
      (
        key: "total.unit", 
        header: align(left)[£], 
        width: 5em, 
        align: right,
        vline: arguments(stroke: booktabs.lightrule),
        gutter: 0em,
      ),
      (
        key: "total.decimal",
        header: align(right, text(number-type: "old-style")[.00]), 
        align: left
      ),
    )
  ),
)

#set page(height: auto, margin: 1em)
#booktabs.rigor.make(columns: example, 
  data: data, 
  notes: booktabs.footnotes.display-list
)