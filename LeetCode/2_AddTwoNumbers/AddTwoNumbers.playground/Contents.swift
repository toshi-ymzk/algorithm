
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        var l1Cursor: ListNode = l1
        var l2Cursor: ListNode = l2
        
        var sum = l1.val + l2.val
        var result: [Int] = [sum % 10]
        var carry: Int = sum / 10
        
        let appendNext = {(val: Int) in
            sum = val + carry
            result.append(sum % 10)
            carry = sum / 10
        }
        
        while let l1Next = l1Cursor.next, let l2Next = l2Cursor.next {
            appendNext(l1Next.val + l2Next.val)
            l1Cursor = l1Next
            l2Cursor = l2Next
        }
        while let l1Next = l1Cursor.next {
            appendNext(l1Next.val)
            l1Cursor = l1Next
        }
        while let l2Next = l2Cursor.next {
            appendNext(l2Next.val)
            l2Cursor = l2Next
        }
        if carry > 0 {
            result.append(carry)
        }
        return result.reversed().reduce(nil) {
            return ListNode($1, $0)
        }
    }
}

extension ListNode {
    var output: [Int] {
        var result: [Int] = [self.val]
        var node = self
        while let next = node.next {
            result.append(next.val)
            node = next
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

check([7, 0, 8], matches: Solution().addTwoNumbers(
    [2, 4, 3].reversed().reduce(nil) {
        return ListNode($1, $0)
    },
    [5, 6, 4].reversed().reduce(nil) {
        return ListNode($1, $0)
    }
)!.output)

check([0], matches: Solution().addTwoNumbers(
    [0].reversed().reduce(nil) {
        return ListNode($1, $0)
    },
    [0].reversed().reduce(nil) {
        return ListNode($1, $0)
    }
)!.output)

check([8, 9, 9, 9, 0, 0, 0, 1], matches: Solution().addTwoNumbers(
    [9, 9, 9, 9, 9, 9, 9].reversed().reduce(nil) {
        return ListNode($1, $0)
    },
    [9, 9, 9, 9].reversed().reduce(nil) {
        return ListNode($1, $0)
    }
)!.output)

check([6, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], matches: Solution().addTwoNumbers(
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1].reversed().reduce(nil) {
        return ListNode($1, $0)
    },
    [5, 6, 4].reversed().reduce(nil) {
        return ListNode($1, $0)
    }
)!.output)
