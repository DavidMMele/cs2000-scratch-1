use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

"hello CS2000!"


fun choose-hat(temperature :: Number) -> String:
  doc: "returns a message describing temperature appropriate headgear"
  spy:
    temperature
  end
  if temperature >= 80:
    "sun hat"
  else:
  if temperature >= 55:
    "no hat"
  else:
    "winter hat"
  end
  end
where:
  choose-hat(40) is "winter hat"
  choose-hat(55) is "no hat"
end

fun add-glasses(outfit :: String) -> String:
  outfit + ", and add glasses."
end


fun choose-hat-or-visor(temperature :: Number, has-visor :: Boolean) -> String:
  spy: 
    has-visor
  end
  if temperature >= 95:
    if has-visor == true:
      "wear visor"
      
    else:
      "wear sun hat"
    end
  else:
    if temperature >= 65:
      "wear no hat"
    else:
      "wear winter hat"
    end
  end
end