import Foundation

private extension Array where Element == Int {
  var hasBalancedSplit: Bool {
    guard self.count > 1 else {
        return false
    }
    let sorted = self.sorted()
    var i = 0
    var j = self.count - 1
    var sumA = sorted[i]
    var sumB = sorted[j]
    // While elements remain between i and j
    while j - i > 1 {
        if sumA < sumB {
            i += 1
            sumA += sorted[i]
        } else if sumB < sumA {
            j -= 1
            sumB += sorted[j]
        } else {
            i += 1
            j -= 1
            if i < j {
                sumA += sorted[i]
                sumB += sorted[j]
            } else if i == j {
                // When both sums are the same remaining an element
                return false
            }
        }
    }
    if sorted[i] >= sorted[j] {
        return false
    }
    return sumA == sumB
  }
}

var testCaseNumber = 1

private func check(_ expectedValue: Bool, matches output: Bool) {
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

let arr1 = [2, 1, 5, 2]
check(true, matches: arr1.hasBalancedSplit)

let arr2 = [3, 6, 3, 4, 4]
check(false, matches: arr2.hasBalancedSplit)
