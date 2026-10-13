use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv
# Your project work here!


#https://data.london.gov.uk/download/e5n6w/qbc/M1045_MonthlyCrimeDashboard_KnifeCrimeData.csv

#how many different types of crime are there? What is the most common crime? What month has
#the most crime? What neighborhood has the most crimes? the most violent crimes?

#Checkpoint 2
crime-raw = load-table:
  month-year :: String,
  area-type :: String,
  borough-snt :: String,
  area-name :: String,
  area-code :: String,
  crime-type :: String,
  crime-subtype :: String,
  measure :: String,
  financial-year :: String,
  offences :: String,
  refresh-date :: String
  source: csv-table-url("https://data.london.gov.uk/download/e5n6w/qbc/M1045_MonthlyCrimeDashboard_KnifeCrimeData.csv", default-options)
end

crime-selected = select-columns(crime-raw,
  [list: "month-year", "area-name", "crime-type", "measure",
    "financial-year", "offences"])
crime = transform-column(crime-selected, "offences", string-to-number-unsafe)


#Which neighbourhood has the most crime? build a bar chart showing each burrow and the amount of crimes that happened in that burrow

fun has-location(r :: Row) -> Boolean:
  doc: "Returns true if the row has a real neighbourhood name"
  name = get-column(r, "area-name")
  if name == "N/K":
    false
  else if name == "":
    false
  else if name == "Non MET police force":
    false
  else:
    true
  end
end

crime-located = filter-with(crime, has-location)

crime-by-area = group(crime-located, "area-name")

fun area-total(r :: Row) -> Number:
  doc: "Returns the total offences in one neighbourhood's subtable"
  sum(get-column(r, "subtable"), "offences")
end

area-totals = build-column(crime-by-area, "total", area-total)

bar-chart(area-totals, "value", "total")

#we should make top 10/20 burrows to make it more readable, order from biggest to least, break them up by year.
