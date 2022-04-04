func isBalanced(s: String) -> Bool {
    var expectedStack: [String.Element] = []
    for char in s {
        if char == "(" {
            expectedStack.append(")")
        }
        if char == "{" {
            expectedStack.append("}")
        }
        if char == "[" {
            expectedStack.append("]")
        }
        if let expected = expectedStack.last,
           char == ")" || char == "}" || char == "]" {
            if expected == char {
                expectedStack.removeLast()
            } else {
                return false
            }
        }
    }
    // Return if all of expected close-brackets are paired
    return expectedStack.count == 0
}

var test_case_number = 1;
func check(expected: Bool, output: Bool) {
    let result = expected == output
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    if result {
        print("\(rightTick) Test #\(test_case_number)")
    } else {
        print("\(wrongTick) Test #\(test_case_number): Expected [\(expected)] Your output: [\(output)]")
    }
    test_case_number += 1
}

let s1 = "{[(])}"
check(expected: false, output: isBalanced(s: s1))

let s2 = "{{[[(())]]}}"
check(expected: true, output: isBalanced(s: s2))

let s3 = "{{[[(())]]}"
check(expected: false, output: isBalanced(s: s3))
