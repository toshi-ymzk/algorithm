
struct RotationalCipher {
    let backing: String
    let lowerAlphabetList = ("a".unicodeScalars.first!.value..."z".unicodeScalars.first!.value)
        .map {Character(UnicodeScalar($0)!)}
    let upperAlphabetList = ("A".unicodeScalars.first!.value..."Z".unicodeScalars.first!.value)
        .map {Character(UnicodeScalar($0)!)}
    let numberList = (0...9).map {Character(String($0))}

    func cipher(withRotationFactor: Int) -> String {
        var lowerAlphabetIndexTable = [Character: Int]()
        lowerAlphabetList.enumerated().forEach {
            lowerAlphabetIndexTable[$0.element] = $0.offset
        }
        var upperAlphabetIndexTable = [Character: Int]()
        upperAlphabetList.enumerated().forEach {
            upperAlphabetIndexTable[$0.element] = $0.offset
        }
        var numberIndexTable = [Character: Int]()
        numberList.enumerated().forEach {
            numberIndexTable[$0.element] = $0.offset
        }
        var result: String = ""
        for char in backing {
            if let index = lowerAlphabetIndexTable[char] {
                result.append(
                    rotate(
                        char: char,
                        index: index,
                        charList: lowerAlphabetList,
                        withRotationFactor: withRotationFactor
                    )
                )
            } else if let index = upperAlphabetIndexTable[char] {
                result.append(
                    rotate(
                        char: char,
                        index: index,
                        charList: upperAlphabetList,
                        withRotationFactor: withRotationFactor
                    )
                )
            } else if let index = numberIndexTable[char] {
                result.append(
                    rotate(
                        char: char,
                        index: index,
                        charList: numberList,
                        withRotationFactor: withRotationFactor
                    )
                )
            } else {
                result.append(char)
            }
        }
        return result
    }
    
    private func rotate(char: Character, index: Int, charList: [Character], withRotationFactor: Int) -> Character {
        let tmpIndex = index + withRotationFactor % charList.count
        let rotatedIndex = tmpIndex < charList.count ? tmpIndex : tmpIndex - charList.count
        return charList[rotatedIndex]
    }
}

private extension String {
  var characterArray: String {
    return "[\"\(self)\"]"
  }
}

private var testCaseNumber = 1;
 
private extension RotationalCipher {
  static func check(_ expectedValue: String, against output: String) {
    let rightTick = "\u{2713}";
    let wrongTick = "\u{2717}";
    
    let result = expectedValue == output
    if result {
      print("\(rightTick) Test #\(testCaseNumber)")
    } else {
      print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue.characterArray) Your output: \(output.characterArray)")
    }
    testCaseNumber += 1
  }
}

let input1 = "All-convoYs-9-be:Alert1."
let expected1 = "Epp-gsrzsCw-3-fi:Epivx5."
let output1 = RotationalCipher(backing: input1).cipher(withRotationFactor: 4)
print("\(output1)")
RotationalCipher.check(expected1, against: output1)

let input2 = "abcdZXYzxy-999.@"
let expected2 = "stuvRPQrpq-999.@"
let output2 = RotationalCipher(backing: input2).cipher(withRotationFactor: 200)
RotationalCipher.check(expected2, against: output2)
