import Foundation

extension String {
    func minLengthOfRearrangedSubstring(containing substring: String) -> Int {
        var tmpChars = Array(self)
        var minIndex = tmpChars.count - 1
        var maxIndex = 0
        var removedIndexes = [Int]()
        for char in Array(substring) {
            if let index = tmpChars.firstIndex(of: char) {
                if index < minIndex {
                    minIndex = index
                }
                if index > maxIndex {
                    maxIndex = index
                }
                // calculate original index comparing with removed indexes
                var originalIndex = index
                for i in removedIndexes {
                    if i <= index {
                        originalIndex += 1
                    }
                }
                // remove matched character
                tmpChars.remove(at: index)
                removedIndexes.append(originalIndex)
            } else {
                // return -1 if it doesn't contain substring
                return -1
            }
        }
        return minIndex >= maxIndex ? -1 : maxIndex - minIndex + 1
    }
}

var testCaseNumber = 1

private func check(_ expectedValue: Int, matches output: Int) {
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
    
  let result = expectedValue == output
  if result {
      print("\(rightTick) Test #\(testCaseNumber)")
  } else {
      print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue) Your output: \(output)")
  }
  testCaseNumber += 1
}

let s1 = "dcbefebce"
let t1 = "fd"
let output1 = s1.minLengthOfRearrangedSubstring(containing: t1)
check(5, matches: output1)

let s3 = "bfbeadbcbcbfeaaeefcddcccbbbfaaafdbebedddf"
let t3 = "cbccfafebccdccebdd"

let s2 = "bfbeadbcbcbfeaaeefcddcccbbbfaaafdbebedddf"
let t2 = "cbccfafebccdccebdd"
let output2 = s2.minLengthOfRearrangedSubstring(containing: t2)
check(-1, matches: output2)
