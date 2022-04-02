func numberOfWays(arr: [Int], k: Int) -> Int {
    var hashTable = [Int: Int]()
    arr.forEach {
        hashTable[$0] = (hashTable[$0] ?? 0) + 1
    }
    var count = 0
    hashTable.keys.forEach {
        if $0 == k / 2, let numberCount = hashTable[$0], numberCount > 1 {
            count += numberCount * (numberCount - 1)
        } else if let numberCount = hashTable[k - $0]  {
            count += (hashTable[$0] ?? 0) * numberCount
        }
    }
    return count / 2
}

var test_case_number = 1
func check(expected: Int, output: Int) {
    let result = expected == output
    let rightTick = "\u{2713}"
    let wrongTick = "\u{2717}"
    if result {
        print("\(rightTick) Test #\(test_case_number)")
    } else {
        print("\(wrongTick) Test # \(test_case_number): Expected [\(expected)] Your output: [\(output)]")
    }
    test_case_number += 1
}

let arr1 = [ 1, 2, 3, 4, 3]
let k1 = 6
check(expected: 2, output: numberOfWays(arr: arr1, k: k1))

let arr2 = [ 1, 5, 3, 3, 3]
let k2 = 6
check(expected: 4, output: numberOfWays(arr: arr2, k: k2))

let arr3 = [ 5, 5, 5, 5, 5]
let k3 = 10
check(expected: 10, output: numberOfWays(arr: arr3, k: k3))
