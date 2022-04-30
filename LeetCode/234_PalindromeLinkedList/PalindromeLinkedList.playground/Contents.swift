
// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard let head = head else {
            return false
        }
        var arr: [Int] = [head.val]
        var node = head
        while let next = node.next {
            arr.append(next.val)
            node = next
        }
        guard arr.count > 1 else {
            return true
        }
        var leftPivot = 0
        var rightPivot = arr.count - 1
        while leftPivot <= rightPivot {
            if arr[leftPivot] != arr[rightPivot] {
                return false
            }
            leftPivot += 1
            rightPivot -= 1
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

check(true, matches: Solution().isPalindrome(.init(
    1, .init(
        2, .init(
            2, .init(
                1
            )
        )
    )
)))

check(false, matches: Solution().isPalindrome(.init(
    1, .init(
        2
    )
)))

check(true, matches: Solution().isPalindrome(.init(
    1, .init(
        2, .init(
            2, .init(
                1, .init(
                    2, .init(
                        2, .init(
                            1
                        )
                    )
                )
            )
        )
    )
)))



