class Solution {
    
    let romanNumerals: [String: Int] = [
        "I": 1,
        "IV": 4,
        "V": 5,
        "IX": 9,
        "X": 10,
        "XL": 40,
        "L": 50,
        "XC": 90,
        "C": 100,
        "CD": 400,
        "D": 500,
        "CM": 900,
        "M": 1000
    ]
    
    func romanToInt(_ s: String) -> Int {
        
        var symbolCount: [String: Int] = romanNumerals.keys.reduce([:]) {
            var result = $0
            result[$1] = 0
            return result
        }
        let sArr = Array(s).map { String($0) }
        sArr.forEach {
            // 4
            if $0 == "V", symbolCount["I"] ?? 0 > 0 {
                symbolCount["IV"] = 1
                symbolCount["I"] = 0
            // 9
            } else if $0 == "X", symbolCount["I"] ?? 0 > 0 {
                symbolCount["IX"] = 1
                symbolCount["I"] = 0
            // 40
            } else if $0 == "L", symbolCount["X"] ?? 0 > 0 {
                symbolCount["XL"] = 1
                symbolCount["X"] = 0
            // 90
            } else if $0 == "C", symbolCount["X"] ?? 0 > 0 {
                symbolCount["XC"] = 1
                symbolCount["X"] = 0
            // 400
            } else if $0 == "D", symbolCount["C"] ?? 0 > 0 {
                symbolCount["CD"] = 1
                symbolCount["C"] = 0
            // 900
            } else if $0 == "M", symbolCount["C"] ?? 0 > 0 {
                symbolCount["CM"] = 1
                symbolCount["C"] = 0
            } else {
                symbolCount[$0] = (symbolCount[$0] ?? 0) + 1
            }
        }
        return romanNumerals.keys.reduce(0) {
            return $0 + (symbolCount[$1] ?? 0) * (romanNumerals[$1] ?? 0)
        }
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

check(3, matches: Solution().romanToInt("III"))
check(39, matches: Solution().romanToInt("XXXIX"))
check(58, matches: Solution().romanToInt("LVIII"))
check(1994, matches: Solution().romanToInt("MCMXCIV"))
