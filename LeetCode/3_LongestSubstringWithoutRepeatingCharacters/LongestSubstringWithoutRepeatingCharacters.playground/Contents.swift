
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var subStr: String = ""
        var indexTbl: [String: Int] = [:]
        var longestCount = 0
        s.map { String($0) }.enumerated().forEach {
            if let index = indexTbl[$0.element] {
                if subStr.count > longestCount {
                    longestCount = subStr.count
                }
                subStr = subStr + $0.element
                let remainCount = $0.offset - index
                let dumpCount = subStr.count - remainCount
                let dumpStr = String(subStr.prefix(dumpCount))
                dumpStr.forEach {
                    indexTbl[String($0)] = nil
                }
                indexTbl[$0.element] = $0.offset
                subStr = String(subStr.suffix(remainCount))
            } else {
                subStr = subStr + $0.element
                indexTbl[$0.element] = $0.offset
            }
        }
        if subStr.count > longestCount {
            longestCount = subStr.count
        }
        return longestCount
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

check(3, matches: Solution().lengthOfLongestSubstring("abcabcbb"))
check(1, matches: Solution().lengthOfLongestSubstring("bbbbb"))
check(3, matches: Solution().lengthOfLongestSubstring("pwwkew"))
check(2, matches: Solution().lengthOfLongestSubstring("aab"))
check(2, matches: Solution().lengthOfLongestSubstring("abba"))
check(3, matches: Solution().lengthOfLongestSubstring("dvdf"))
