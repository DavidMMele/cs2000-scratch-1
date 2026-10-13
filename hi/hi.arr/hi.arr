use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


      
    
weather-data =
  table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, -1
    row: "2025-01-05", 90, 0
  end

#clean the temp column from string to number

fun clean-temp(t) -> Number:
  doc: "turns temp in string form to number form for future use"
  if is-string(t):
  string-to-number-unsafe(t)
  else:
    t
  end
where: 
  clean-temp("44") is 44
  clean-temp(45) is 45
end 

better-weather = transform-column(weather-data, "temperature", clean-temp)
#string-to-number-unsafe takes a string and turns it to a number

# define cold, mild, and hot ranges based on temps

# build new column for strings based on the temp

#creeate the bar chart