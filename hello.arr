use context dcic2024

orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end


fun is-high-value(r :: Row) -> Boolean:
  doc: "decide if row is a high value order (More than or equal to 8)."
  value = get-column(r, "amount") >= 8.0
  if value >= 8:
    true
  else:
    false
  end
where:
  is-high-value(get-row(orders, 2)) is true
  is-high-value(get-row(orders, 3)) is false
end