
class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var result: [String] = []
        for i in 1...n {
            if i % 3 == 0, i % 5 == 0 {
                result.append("FizzBuzz")
            } else if i % 3 == 0 {
                result.append("Fizz")
            } else if i % 5 == 0 {
                result.append("Buzz")
            } else {
                result.append("\(i)")
            }
        }
        return result
    }
}

private var testCaseNumber = 1

private func check(_ expectedValue: [String], matches output: [String]) {
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

check(["1","2","Fizz"], matches: Solution().fizzBuzz(3))
check(["1","2","Fizz","4","Buzz"], matches: Solution().fizzBuzz(5))
check(["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"], matches: Solution().fizzBuzz(15))
