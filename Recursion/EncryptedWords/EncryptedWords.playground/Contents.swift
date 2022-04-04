func findEncryptedWord(s: String) -> String {
    guard s.count > 1 else {
        return s
    }
    let chars = Array(s)
    let middleIndex = (chars.count - 1) / 2
    let middleChar = String(chars[middleIndex])
    let leftPortion = chars.count < 3 ? "" : String(chars.prefix(middleIndex))
    let rightPortion = String(chars.suffix(chars.count - (middleIndex + 1)))
    return middleChar
        + findEncryptedWord(s: leftPortion)
        + findEncryptedWord(s: rightPortion)
}

var test_case_number = 1
func check(expected: String, output: String) {
    let result = expected == output
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    if result {
        print("\(rightTick) Test #\(test_case_number)")
    } else {
        print("\(wrongTick) Test # \(test_case_number): Expected \(expected) Your output: \(output)")
    }
    test_case_number += 1
}

let s1 = "abc"
let expected1 = "bac"
let output1 = findEncryptedWord(s: s1)
check(expected: expected1, output: output1)

let s2 = "abcd"
let expected2 = "bacd"
let output2 = findEncryptedWord(s: s2)
check(expected: expected2, output: output2)

let s3 = "asjalksfjaljalkdfjaljfalsf"
let expected3 = "akjasaljsflajldlkjfaajfslf"
let output3 = findEncryptedWord(s: s3)
check(expected: expected3, output: output3)
