use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun size-price(size :: String) -> Number:
    doc: "takes an input as either personal or large, then returns the corresponding price."
  if size == "personal":
    8
    else:
    14
  end
    where:
  size-price("personal") is 8
  size-price("large") is 14 
    end

fun topping-price(toppings :: Number) -> Number:
  doc: "returns the price of the amount of toppings ordered."
  if toppings <= 2:
    0
    else:
    (toppings - 2) * 1.25
  end
where:
  topping-price(0) is 0
  topping-price(2) is 0
  topping-price(3) is 1.25
  topping-price(5) is 3.75
end


fun order-total(size :: String, toppings :: Number, is-pickup :: Boolean) -> Number:
  doc: "calculate the price of pizza order."
  first = size-price(size)
  second = topping-price(toppings)
  if is-pickup == true:
    (first + second) - 2
    else:
    first + second
  end
where:
  order-total("personal", 0, true) is 6
  order-total("large", 3, false) is 15.25
  order-total("large", 3, true) is 13.25
  order-total("personal", 2, false) is 8
end

fun receipt(name :: String, size :: String, toppings :: Number, is-pickup :: Boolean) -> String:
  doc: "returns a reciept with relevant information."
  total = order-total(size, toppings, is-pickup)
  if is-pickup == true:
    name + '\n' + size + " pizza, " + num-to-string(toppings) + " toppings" + " (pickup)" + '\n' + "Total: $" + num-to-string-digits(order-total(size, toppings, is-pickup), 2)
  else:
      name + '\n' + size + " pizza, " + num-to-string(toppings) + " toppings" + '\n' + "Total: $" + num-to-string-digits(order-total(size, toppings, is-pickup), 2)  
  end
  
where:
  receipt("David", "personal", 5, true) is "David\npersonal pizza, 5 toppings (pickup)\nTotal: $9.75"
  receipt("Maddie", "large", 4, false) is "Maddie\nlarge pizza, 4 toppings\nTotal: $16.50"
end


fun receipt-image(name :: String, size :: String, toppings :: Number, is-pickup :: Boolean) -> Image:
  doc: "returns a rectangular image of your reciept"
  stuff = text(receipt(name, size, toppings, is-pickup), 12, "black")
  if is-pickup == true:
    overlay(stuff, rectangle(300, 100, "solid", "red"))
  else:
    overlay(stuff, rectangle(300, 100, "solid", "blue"))
  end
end
