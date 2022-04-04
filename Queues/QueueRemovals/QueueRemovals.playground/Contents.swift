import Foundation

private extension Array where Element == Int {
    
    typealias IntWithIndex = (index: Int, value: Int)
    
    func findPositions(n: Int, x: Int) -> [Int] {
        var result: [Int] = []
        var tmpArr: [IntWithIndex] = self.enumerated().map { (index: $0 + 1, value: $1)}
        var sliceEnd = x
        for _ in 1...x {
            var remainedArr: [IntWithIndex] = []
            if tmpArr.count < x {
                sliceEnd = tmpArr.count
            } else {
                remainedArr = tmpArr[sliceEnd..<tmpArr.count].map { $0 }
            }
            var poppedArr = tmpArr[0..<sliceEnd].map { $0 }
            if poppedArr.count > 1 {
                var largest: IntWithIndex = (index: 0, value: 0)
                poppedArr.enumerated().forEach {
                    if $1.value > largest.value {
                        largest = (index: $0, value: $1.value)
                    }
                }
                result.append(poppedArr.remove(at: largest.index).index)
            }
            tmpArr = (remainedArr + poppedArr).map { (
                index: $0.index,
                value: $0.value - 1 < 0 ? 0 : $0.value - 1) }
        }
        return result
    }
}

private var testCaseNumber = 1

private func check(_ expectedValue: [Int], matches output: [Int]) {
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

let arr1 = [1, 2, 2, 3, 4, 5]
let expected1 = [5, 6, 4, 1, 2]
let output1 = arr1.findPositions(n: 6, x: 5)
check(expected1, matches: output1)

let arr2 = [2, 4, 2, 4, 3, 1, 2, 2, 3, 4, 3, 4, 4]
let expected2 = [2, 5, 10, 13]
let output2 = arr2.findPositions(n: 13, x: 4)
check(expected2, matches: output2)

let arr3 = [1, 2, 2, 3, 4, 5]
let expected3 = [6, 5, 4, 1, 2]
let output3 = arr3.findPositions(n: 6, x: 7)
check(expected3, matches: output3)
