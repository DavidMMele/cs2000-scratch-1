use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include image
include reactors

HUSKY-URL =
  "https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/img/lab5-husky.png"
DOGHOUSE-URL =
  "https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/img/lab5-doghouse.png"
BACKGROUND-URL =
  "https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/img/lab5-background.png"

husky = scale(0.6, image-url(HUSKY-URL))
doghouse = scale(0.6, image-url(DOGHOUSE-URL))
background = image-url(BACKGROUND-URL)

BACK = 40
HEIGHT = 400
WIDTH = 750
DOGHOUSE-X = WIDTH - 120
GROUND-Y = HEIGHT - 90

#Problem 1
#Part A
fun frame-1():
  doc: "husky, doghouse, and background"
  place-image(husky, 100, 275, (place-image(doghouse, 600, 275, background)))
end

#Part C
fun draw-husky(x-val :: Number):
  doc: "husky, doghouse, and background"
  place-image(husky, x-val, 275, (place-image(doghouse, 600, 275, background)))
end

#Problem 2
#Part B
fun next-x(x :: Number) -> Number:
  doc: "generate x coordinate for the next frame"
  x + 15
end

#Problem 3
husky-reactor = reactor:
  init: 0,
  to-draw: draw-husky,
  on-tick: next-x
end



#Part A
#I have been messing with "X + 20+ in next-x, I think 15 moves good

#Part B
#Can we make the husky stop moving when next-x gets to a certain number?
#Can we make the husky turn around, and walk backwards

#Problem 4
fun back-husky(x :: Number, key :: String) -> Number:
  doc: "if the key is 'b', move left by BACK; otherwise return x as given"
  if key == "b":
    x - BACK
  else:
    x
  end
  
where:
  back-husky(100, "b") is 60
  back-husky(200, "b") is 160
  back-husky(100, "a") is 100
end

#Specifically: if the user presses "b", reduce the husky's x-coordinate by 40 pixels (use the BACK constant). Finish designing back-husky: write where examples and the implementation. Since the output differs based on the input, you'll need a conditional.

husky-reactor-v2 = reactor:
  init: 0,
  to-draw: draw-husky,
  on-tick: next-x,
  on-key: back-husky
end


#Problem 6

fun at-doghouse(x :: Number) -> Boolean:
  doc: "When the husky reaches the doghouse, it stops moving"
  if x >= 580:
    true
  else:
    false
  end
where:
  at-doghouse(540) is false
  at-doghouse(590) is true
  at-doghouse(460) is false
end

husky-reactor-v3 = reactor:
  init: 0,
  to-draw: draw-husky,
  on-tick: next-x,
  on-key: back-husky,
  stop-when: at-doghouse
end
interact(husky-reactor-v3)