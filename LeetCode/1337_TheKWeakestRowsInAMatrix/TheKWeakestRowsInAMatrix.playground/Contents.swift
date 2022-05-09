
class Solution {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var rows: [Row] = []
        mat.enumerated().forEach {
            rows.append(.init(index: $0.offset, soldierCount: soldierCount($0.element)))
        }
        rows = quickSort(rows)
        return rows.prefix(k).map { $0.index }
    }
    
    private func soldierCount(_ arr: [Int]) -> Int {
        var count = 0
        for i in arr {
            if i == 1 {
                count += 1
            } else {
                break
            }
        }
        return count
    }
}

struct Row: Comparable {
    let index: Int
    let soldierCount: Int
    
    static func < (lhs: Row, rhs: Row) -> Bool {
        return lhs.soldierCount == rhs.soldierCount ?
            lhs.index < rhs.index :
            lhs.soldierCount < rhs.soldierCount
    }
}

private func quickSort<T: Comparable>(_ arr: [T]) -> [T] {
    guard arr.count > 1 else {
        return arr
    }
    let pivot = arr[arr.count / 2]
    var less: [T] = []
    var greater: [T] = []
    var equal: [T] = []
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

check([2,0,3],
      matches: Solution().kWeakestRows([[1,1,0,0,0],
                                        [1,1,1,1,0],
                                        [1,0,0,0,0],
                                        [1,1,0,0,0],
                                        [1,1,1,1,1]], 3))

check([0,2],
      matches: Solution().kWeakestRows([[1,0,0,0],
                                        [1,1,1,1],
                                        [1,0,0,0],
                                        [1,0,0,0]], 2))
