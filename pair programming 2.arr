use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as L

## part 1:

fun word-result(expected :: String, typed :: String) -> String:
doc: "returns either exact or case or wrong depending on how the typed word lines up against the expected word."
if expected == typed:
  "exact"
  else if string-to-lower(expected) == string-to-lower(typed):
  "case"
  else:
  "wrong"
  end
where:
word-result("find", "Find") is "case"
word-result("find", "find") is "exact"
word-result("find", "F") is "wrong"
end


## Part 2: All the results

fun results(expected :: List, typed :: List) -> List block:
  doc: "returns a list of all the word results"
  var x = 0
  var y = [L.list:]
  for each(word from expected) block:
    y := L.append(y, [L.list: word-result(word, L.get(typed, x))])
    x := x + 1
  end
  y
where:
  results([L.list: "hi", "Hello", "Hi"], [L.list: "hi", "hello", "hello"])
    is [L.list: "exact", "case", "wrong"]
end
 
## Part 3: Accuracy

fun accuracy(expected :: List, typed :: List) -> Number:
  doc: "returns the % of how similar typed is to expected"
  var b = results(expected, typed)
  
  c = L.filter(lam(a): a == "exact" end, b)
  d-exacts = L.length(c)
  e-results = L.length(b)
  (d-exacts / e-results) * 100
where:
  accuracy([L.list: "hi", "Hello", "Hi", "Hello"], [L.list: "hi", "hello", "hello", "Hello"]) is 50
end

## Part 4: Test report

fun test-report(t :: Table) -> String:
  doc: "returns the accuracy %, the 
  
end

The app keeps each test in a table with an `expected` column and a `typed` column:

```pyret
sentence = table: expected :: String, typed :: String
  row: "We", "We"
  row: "meet", "meet"
  row: "in", "in"
  row: "West", "west"
  row: "Village", "Village"
  row: "at", "at"
  row: "noon", "nono"
  row: "today", "today"
end
```

Design and implement `test-report`, which takes a table like this and returns a one-line `String` giving the accuracy, how many words had only a capitalization slip, and how many words were wrong. You can turn a Number into a String with `num-to-string`.

Example behavior:

- the table above → `"Exact: 75%, capitalization slips: 1, wrong: 1"`
- a table whose expected words are `"hello"` and `"world"` and whose typed words are `"Hello"` and `"wrld"` → `"Exact: 0%, capitalization slips: 1, wrong: 1"`