
struct RotationalCipher {
    let backing: String
    let lowerAlphabetList = Array("a".unicodeScalars.first!.value..."z".unicodeScalars.first!.value)
        .map {Character(UnicodeScalar($0)!)}
    let upperAlphabetList = Array("A".unicodeScalars.first!.value..."Z".unicodeScalars.first!.value)
        .map {Character(UnicodeScalar($0)!)}
    let numberList = Array(0...9).map {Character(String($0))}
    
    func cipher(withRotationFactor: Int) -> String {
        let characters = Array(backing)
        let result = characters.map { char -> String.Element in
            return [lowerAlphabetList, upperAlphabetList, numberList].reduce(char, {
                return rotate(input: $0, rotationFactor: withRotationFactor, list: $1)
            })
        }
        return String(result)
    }
    
    private func rotate(input: Character, rotationFactor: Int, list: [Character]) -> Character {
        if let firstIndex = list.firstIndex(of: input) {
            var rotatedIndex = firstIndex + rotationFactor % list.count
            if rotatedIndex >= list.count {
                rotatedIndex -= list.count
            }
            return list[rotatedIndex]
        }
        return input
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
