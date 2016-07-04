import Foundation

class Robot {
    var name: String

    init() {
        name = Robot.generateName()
    }

    func resetName() {
        name = Robot.generateName()
    }

    private static func generateName() -> String {
        let letters = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)
        return "\(letters.random()!)\(letters.random()!)\((100..<1000).random())"
    }
}

extension Range {
    func random() -> Int {
        let min = UInt32(self.lowerBound as! Int)
        let max = UInt32(self.upperBound as! Int)

        return Int(min + arc4random_uniform(max - min))
    }
}

extension Set {
    func random() -> Element? {
        return count == 0 ? nil : self[index(startIndex, offsetBy: (0..<count).random())]
    }
}
