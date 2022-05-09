
func quicksort<T: Comparable>(_ arr: [T]) -> [T] {
    guard arr.count > 1 else { return arr }
    
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
    return quicksort(less) + equal + quicksort(greater)
}

private var testCaseNumber = 1;

private func check(expected: [Int], output: [Int]) {
  let result = expected == output
  if result {
    print("\u{2713} Test #\(testCaseNumber)")
  } else {
    print("\u{2717} Test #\(testCaseNumber) Expected: \(expected) Output: \(output)")
  }
  testCaseNumber += 1
}

let arr = [10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26]
check(expected: [-1, 0, 1, 2, 3, 5, 8, 8, 9, 10, 14, 26, 27], output: quicksort(arr))
