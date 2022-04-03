import Foundation

struct GrowthRates {
    let rates: [Double]
}

private extension GrowthRates {
    
    func daysUntilBillionUsers() -> Int {
        var day = 1
        var userCounts = rates
        var totalCount = userCounts.reduce(0, +)
        while totalCount < 1000_000_000 {
            day += 1
            userCounts = userCounts.enumerated().map { $0.element * rates[$0.offset] }
            totalCount = userCounts.reduce(0, +)
        }
        return day
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

let rates0 = GrowthRates(rates: [1.5])
check(52, matches: rates0.daysUntilBillionUsers())

let rates1 = GrowthRates(rates: [1.1, 1.2, 1.3])
check(79, matches: rates1.daysUntilBillionUsers())

let rates2 = GrowthRates(rates: [1.01, 1.02])
check(1047, matches: rates2.daysUntilBillionUsers())
