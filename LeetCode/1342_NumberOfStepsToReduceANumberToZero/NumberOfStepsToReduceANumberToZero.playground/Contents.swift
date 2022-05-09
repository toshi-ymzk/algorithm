
class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        guard num > 0 else {
            return 0
        }
        var count = 0
        var n = num
        while n > 1 {
            count += 1
            if n % 2 == 0 {
                n = n / 2
            } else {
                n -= 1
            }
        }
        return count + 1
    }
}

private var testCaseNumber = 1

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

check(6, matches: Solution().numberOfSteps(14))
check(4, matches: Solution().numberOfSteps(8))
check(12, matches: Solution().numberOfSteps(123))
check(0, matches: Solution().numberOfSteps(0))
