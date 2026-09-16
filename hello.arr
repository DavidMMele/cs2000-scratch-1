use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

"hello CS2000!"

fun greeting(name :: String) -> String:
  "what's up " + name
end
greeting("david")

fun three-color-flag(top, middle, bottom):
  doc: "returns a flag with 3 colored stripes of your choosing"
  frame(
    above(rectangle(120, 30, "solid", top),
      above(rectangle(120, 30, "solid", middle),
        rectangle(120, 30, "solid", bottom))))
end

Austria =
  three-color-flag("red", "white", "red")


fun tshirt-cost(quantity :: Number, message :: String):
  base-cost = quantity * 5
  lettering-cost = string-length(message) * 0.10
  total-cost = base-cost + lettering-cost
  "the total cost of " + num-to-string(quantity) + " T-shirts saying " + message + " is $" + num-to-string(total-cost) + "."
end
  
Shirt-maker = tshirt-cost(5, "Go team!")
  
