
func matchingPairs(s: String, t: String) -> Int {
    let sChars = Array(s)
    let tChars = Array(t)
    var sDiffChars = [String.Element]()
    var tDiffChars = [String.Element]()
    let matchCount = sChars.enumerated().reduce(0, {
        if $1.element == tChars[$1.offset] {
            return $0 + 1
        } else {
            sDiffChars.append($1.element)
            tDiffChars.append(tChars[$1.offset])
            return $0
        }
    })
    var pairCount = 0
    for (i, sDiff) in sDiffChars.enumerated() {
        for (j, tDiff) in tDiffChars.enumerated() {
            if sDiff == tDiff {
                pairCount = 1
                if sDiffChars[j] == tDiffChars[i] {
                    return matchCount + 2
                }
            }
        }
    }
    if pairCount == 0 {
        pairCount = -2
    }
    return matchCount + pairCount
}

var test_case_number = 1
func check(expected: Int, output: Int) {
  let result = expected == output
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
    
  if result {
      print("\(rightTick) Test #\(test_case_number)")
  } else {
      print("\(wrongTick) Test # \(test_case_number): Expected [\(expected)] Your output: [\(output)]")
  }
  test_case_number += 1
}

let s1 = "abcde"
let t1 = "adcbe"
let expected1 = 5
let output1 = matchingPairs(s: s1, t: t1)
check(expected: expected1, output: output1)

let s2 = "abcd"
let t2 = "abcd"
let expected2 = 2
let output2 = matchingPairs(s: s2, t: t2)
check(expected: expected2, output: output2)
