
class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var result = 0
        for account in accounts {
            let wealth = account.reduce(0, +)
            result = max(result, wealth)
        }
        return result
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

check(6, matches: Solution().maximumWealth([[1, 2, 3], [3, 2, 1]]))
check(10, matches: Solution().maximumWealth([[1,5],[7,3],[3,5]]))
check(17, matches: Solution().maximumWealth([[2,8,7],[7,1,3],[1,9,5]]))
