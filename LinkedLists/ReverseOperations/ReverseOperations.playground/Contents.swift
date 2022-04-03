import Foundation

class Node {
  var data: Int
  var nextNode: Node?
    
  init(data: Int, next: Node? = nil) {
    self.data = data
    self.nextNode = next
  }
}

private extension Node {
    
    func reverse() -> Node {
        var cursor = self
        var dataArr: [Int] = [data]
        while let node = cursor.nextNode {
            dataArr.append(node.data)
            cursor = node
        }
        var resultArr: [Int] = []
        var evenArr: [Int] = []
        for (i, d) in dataArr.enumerated() {
            if d % 2 == 0 {
                evenArr.append(dataArr[i])
            } else {
                if evenArr.count > 0 {
                    resultArr += evenArr.reversed()
                    evenArr = []
                }
                resultArr.append(dataArr[i])
            }
        }
        if evenArr.count > 0 {
            resultArr += evenArr.reversed()
            evenArr = []
        }
        var result = Node(data: resultArr.removeLast())
        resultArr.reversed().forEach {
            result = Node(data: $0, next: result)
        }
        return result
    }
}

struct NodeView: IteratorProtocol {
  var node: Node?
  mutating func next() -> Int? {
    defer { node = node?.nextNode }
    return node?.data
  }
}
 
extension Node: Sequence {
  typealias Element = Int
  func makeIterator() -> NodeView {
    return NodeView(node: self)
  }
}

private extension Node {
  static func from(array: [Int]) -> Node {
    var array = array
    var tail = Node(data: array.removeLast())
    for num in array.reversed() {
      tail = Node(data: num, next: tail)
    }
    return tail
  }
}

extension Node: Equatable {
  static func == (lhs: Node, rhs: Node) -> Bool {
    return Array(lhs) == Array(rhs)
  }
}

var testCaseNumber = 1

func check(_ expectedHead: Node, matches outputHead: Node) {
  let rightTick = "\u{2713}"
  let wrongTick = "\u{2717}"
    
  if expectedHead == outputHead {
    print("\(rightTick) Test #\(testCaseNumber)")
  } else {
    print("\(wrongTick) Test #\(testCaseNumber) Expected: \(Array(expectedHead)) Your output: \(Array(outputHead))")
  }
  testCaseNumber += 1
}

let head1 = Node.from(array: [1, 2, 8, 9, 12, 16])
let expected1 = Node.from(array: [1, 8, 2, 9, 16, 12])
let output1 = head1.reverse()
check(expected1, matches: output1)

let head2 = Node.from(array: [2, 18, 24, 3, 5, 7, 9, 6, 12])
let expected2 = Node.from(array: [24, 18, 2, 3, 5, 7, 9, 12, 6])
let output2 = head2.reverse()
check(expected2, matches: output2)

// Util function to reverse node without extra memory
private extension Node {
    
    func reversed() -> Node {
        var result = Node(data: self.data)
        var cursor = self
        while let node = cursor.nextNode {
            result = Node(data: node.data, next: result)
            cursor = node
        }
        return result
    }
}

let head3 = Node.from(array: [2, 18, 24, 3, 5, 7, 9, 6, 12])
let expected3 = Node.from(array: [12, 6, 9, 7, 5, 3, 24, 18, 2])
let output3 = head3.reversed()
check(expected3, matches: output3)
