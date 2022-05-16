class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let arr = quickSort(nums.enumerated().map {Number(value: $0.element, index: $0.offset)})
        var left = 0
        var right = arr.count - 1
        
        while left < right {
            let sum = arr[left].value + arr[right].value
            if sum < target {
                left += 1
            } else if sum > target {
                right -= 1
            } else {
                break
            }
        }
        return quickSort([arr[left].index, arr[right].index])
    }
}

struct Number: Comparable {
    let value: Int
    let index: Int
    
    static func < (lhs: Number, rhs: Number) -> Bool {
        return lhs.value < rhs.value
    }
}

func quickSort<T: Comparable>(_ arr: [T]) -> [T] {
    guard arr.count > 1 else {
        return arr
    }
    let pivot = arr[arr.count / 2]
    var less: [T] = []
    var equal: [T] = []
    var greater: [T] = []
    arr.forEach {
        if $0 < pivot {
            less.append($0)
        } else if $0 > pivot {
            greater.append($0)
        } else {
            equal.append($0)
        }
    }
    return quickSort(less) + equal + quickSort(greater)
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

check([0, 1], matches: Solution().twoSum([2,7,11,15], 9))
check([1, 2], matches: Solution().twoSum([3,2,4], 6))
check([0, 1], matches: Solution().twoSum([3,3], 6))
