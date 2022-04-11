
func quicksort<T: Comparable>(_ arr: [T]) -> [T] {
    guard arr.count > 1 else { return arr }
    
    let pivot = arr[arr.count / 2]
    let less = arr.filter { $0 < pivot }
    let equal = arr.filter { $0 == pivot }
    let greater = arr.filter { $0 > pivot }
    
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
