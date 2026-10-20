use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L
"hello CS2000!"

# number 1
    
fun absolute-values(l :: List) -> List block:
      doc: "takes a list of numbers and returns a list of absolute values"
var x = [L.list:]
  for each(r from l):
    x := L.append(x, [L.list: num-abs(r)])
  end
  x
where:
  absolute-values([L.list: -1, 2, -3]) is [L.list: 1, 2, 3]
  absolute-values([L.list: 0, -5, 4]) is [L.list: 0, 5, 4]
  absolute-values([L.list:]) is [L.list:]
end

# number 2

fun exactly-three-chars(m :: List) -> List block:
  doc: "takes a list of strings and returns a list that contains all the strings that have only 3 characters"
  var b = [L.list:]
  for each(d from m):
    when string-length(d) == 3:
      b := L.append(b, [L.list: d])
    end
  end
  b
where:
  exactly-three-chars([L.list: "cat", "horse", "dog", "a"]) is [L.list: "cat", "dog"]
  exactly-three-chars([L.list: "hi", "hello"]) is [L.list:]
  exactly-three-chars([L.list: "one", "two", "six"]) is [L.list: "one", "two", "six"]
  exactly-three-chars([L.list:]) is [L.list:]
end

# number 3

fun all-even(temp :: List) -> Boolean block:
  doc: "takes a list and returns true if all numbers in that list are even"
  var val = true
  for each(r from temp):
    when num-modulo(r, 2) <> 0:
      val := false
    end
  end
  val
where:
  all-even([L.list: 2, 4, 6]) is true
  all-even([L.list: 2, 3, 6]) is false
  all-even([L.list: -4, 0, 8]) is true
  all-even([L.list:]) is true
end

# number 4

fun count-in-range(stuff :: List, min :: Number, max :: Number) -> Number block:
  doc: "takes a list of numbers, a minimum and maximum number, and returns the amount of numbers in the list that are between that min and max"
  var x = 0
  for each(r from stuff):
    when (r >= min) and (r <= max):
      x := x + 1
    end
  end
  x
where:
  count-in-range([L.list: 1, 5, 10, 15], 5, 10) is 2
  count-in-range([L.list: 1, 2, 3], 10, 20) is 0
  count-in-range([L.list: 3, 4, 5], 3, 5) is 3
  count-in-range([L.list: -5, 0, 5], -10, 10) is 3
  count-in-range([L.list:], 0, 100) is 0
end

