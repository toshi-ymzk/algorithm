
func mergeSort(_ arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    let leftPile = mergeSort(Array(arr[0..<middleIndex]))
    let rightPile = mergeSort(Array(arr[middleIndex..<arr.count]))
    
    return merge(leftPile: leftPile, rightPile: rightPile)
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var result = [Int]()
    result.reserveCapacity(leftPile.count + rightPile.count)
    
    while leftIndex < leftPile.count, rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            result.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            result.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            result.append(leftPile[leftIndex])
            result.append(rightPile[rightIndex])
            leftIndex += 1
            rightIndex += 1
        }
    }
    while leftIndex < leftPile.count {
        result.append(leftPile[leftIndex])
        leftIndex += 1
    }
    while rightIndex < rightPile.count {
        result.append(rightPile[rightIndex])
        rightIndex += 1
    }
    return result
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
check(expected: [-1, 0, 1, 2, 3, 5, 8, 8, 9, 10, 14, 26, 27], output: mergeSort(arr))
