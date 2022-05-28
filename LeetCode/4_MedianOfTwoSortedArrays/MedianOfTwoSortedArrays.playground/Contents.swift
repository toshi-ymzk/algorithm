
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var cursor1 = 0
        var cursor2 = 0
        var result: [Double] = []
        while cursor1 < nums1.count, cursor2 < nums2.count {
            if nums1[cursor1] < nums2[cursor2] {
                result.append(Double(nums1[cursor1]))
                cursor1 += 1
            } else if nums1[cursor1] > nums2[cursor2] {
                result.append(Double(nums2[cursor2]))
                cursor2 += 1
            } else {
                result.append(Double(nums1[cursor1]))
                result.append(Double(nums2[cursor2]))
                cursor1 += 1
                cursor2 += 1
            }
        }
        while cursor1 < nums1.count {
            result.append(Double(nums1[cursor1]))
            cursor1 += 1
        }
        while cursor2 < nums2.count {
            result.append(Double(nums2[cursor2]))
            cursor2 += 1
        }
        let count = result.count
        if count == 1 {
            return result[0]
        } else if count % 2 == 0 {
            return (result[count / 2] + result[count / 2 - 1]) / 2
        } else {
            return result[count / 2]
        }
    }
}

private var testCaseNumber = 1

private func check(_ expectedValue: Double, matches output: Double) {
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

check(1, matches: Solution().findMedianSortedArrays([1], []))
check(2, matches: Solution().findMedianSortedArrays([1, 3], [2]))
check(2.5, matches: Solution().findMedianSortedArrays([1, 2], [3, 4]))
