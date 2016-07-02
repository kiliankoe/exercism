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
        return String(number.characters.prefix(3))
    }
}

extension PhoneNumber: CustomStringConvertible {
    var description: String {
        let firstBlock = String(number.characters.suffix(7).prefix(3))
        let secondBlock = String(number.characters.suffix(4))
        return "(\(areaCode)) \(firstBlock)-\(secondBlock)"
    }
}

extension String {
    func removingAllButDigits() -> String {
        let allowedChars = Set("0123456789".characters)
        let str = self.characters.filter { allowedChars.contains($0) }
        return String(str)
    }
}
