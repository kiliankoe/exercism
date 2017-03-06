import Foundation

struct Scrabble {
    let word: String

    init(_ word: String?) {
        if let word = word {
            self.word = word
        } else {
            self.word = ""
        }
    }

    var score: Int {
        return Scrabble.score(self.word)
    }

    static func score(_ word: String) -> Int {
        return word
            .uppercased()
            .characters
            .map(score(char:))
            .reduce(0, +)
    }

    private static func score(char: Character) -> Int {
        switch char {
        case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T":
            return 1
        case "D", "G":
            return 2
        case "B", "C", "M", "P":
            return 3
        case "F", "H", "V", "W", "Y":
            return 4
        case "K":
            return 5
        case "J", "X":
            return 8
        case "Q", "Z":
            return 10
        default:
            return 0
        }
    }
}
