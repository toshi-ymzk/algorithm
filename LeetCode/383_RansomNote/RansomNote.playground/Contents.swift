
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var magazineChars:[Character: Int] = [:]
        for char in magazine {
            if let count = magazineChars[char] {
                magazineChars[char] = count + 1
            } else {
                magazineChars[char] = 1
            }
        }
        for char in ransomNote {
            if let count = magazineChars[char] {
                if count < 1 {
                    return false
                }
                magazineChars[char] = count - 1
            } else {
                return false
            }
            
        }
        return true
    }
}

private var testCaseNumber = 1

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

check(false, matches: Solution().canConstruct("a", "b"))
check(false, matches: Solution().canConstruct("aa", "ab"))
check(true, matches: Solution().canConstruct("aa", "aab"))
check(true, matches: Solution().canConstruct("cababab", "aaabbbc"))
