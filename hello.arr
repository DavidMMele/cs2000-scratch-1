use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

"hello CS2000!"
Design a function add-bad-year-column that, given a table with columns for year, costs, and revenues, adds a new column called "bad-year" that contains true if the costs exceed revenues for that year, and false otherwise.
      
      
      fun is-bad-year(r :: Row) -> Boolean:
        doc: "returns true if costs exceed revenue"
        r["costs"] > r["revenues"]
      end
      
      
      fun add-bad-year-column(t :: Table) -> Table:
        doc:
        build column(t, "bad-year", is-bad-year)
      end
      
      
      fun add-bad-year-column(t :: Table) -> Table:
  doc: "Adds a 'bad-year' column that is true when costs exceed revenues"
  build-column(t, "bad-year", lam(r): r["costs"] > r["revenues"] end)
where:
  sample = table: year, costs, revenues
    row: 2020, 500, 400
    row: 2021, 300, 450
    row: 2022, 200, 200
  end
  add-bad-year-column(sample) is
    table: year, costs, revenues, bad-year
      row: 2020, 500, 400, true
      row: 2021, 300, 450, false
      row: 2022, 200, 200, false
    end
end