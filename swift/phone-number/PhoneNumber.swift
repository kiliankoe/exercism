import Foundation

struct PhoneNumber {
    let number: String

    init(_ number: String) {
        var number = number.removingAllButDigits()

        let count = number.characters.count
        if count == 10 {
            self.number = number
        } else if count == 11 && number.characters.first == "1" {
            number.remove(at: number.startIndex)
            self.number = number
        } else {
            self.number = "0000000000"
        }
    }

    var areaCode: String {
        return number.substring(fromPos: 0, toPos: 3)
    }
}

extension PhoneNumber: CustomStringConvertible {
    var description: String {
        let firstBlock = number.substring(fromPos: 3, toPos: 6)
        let secondBlock = number.substring(fromPos: 6, toPos: 10)
        return "(\(areaCode)) \(firstBlock)-\(secondBlock)"
    }
}

extension String {
    func removingAllButDigits() -> String {
        let allowedChars = Set("0123456789".characters)
        let str = self.characters.filter { allowedChars.contains($0) }
        return String(str)
    }

    // This is not ideal. But Swift 3's String API if kinda verbose :/
    func substring(fromPos: Int, toPos: Int) -> String {
        return self.substring(with: self.index(self.startIndex, offsetBy: fromPos)..<self.index(self.startIndex, offsetBy: toPos))
    }
}
