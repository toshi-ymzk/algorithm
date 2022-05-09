
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        var nodeArr: [ListNode] = [head]
        var node = head
        while let next = node.next {
            nodeArr.append(next)
            node = next
        }
        return nodeArr[nodeArr.count / 2]
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

check([3, 4, 5], matches: Solution().middleNode(
    [1, 2, 3, 4, 5].reversed().reduce(nil) {
        return ListNode($1, $0)
    }
)!.output)

check([4, 5, 6], matches: Solution().middleNode(
    [1, 2, 3, 4, 5, 6].reversed().reduce(nil) {
        return ListNode($1, $0)
    }
)!.output)
