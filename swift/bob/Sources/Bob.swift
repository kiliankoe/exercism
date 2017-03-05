import Foundation

extension String {
    fileprivate var isQuestion: Bool {
        guard let last = self.characters.last else { return false }
        return last == "?"
    }

    fileprivate var isScreamed: Bool {
        let numsAndPunctuation = CharacterSet
            .decimalDigits
            .union(.punctuationCharacters)
            .union(.whitespacesAndNewlines)

        let lettersOnly = self.trimmingCharacters(in: numsAndPunctuation)
        if lettersOnly.isEmpty { return false }
        return lettersOnly == lettersOnly.uppercased()
    }
}

enum Bob {
    static func hey(_ input: String) -> String {
        let input = input
            .trimmingCharacters(in: .whitespaces)

        if input.isEmpty {
            return "Fine, be that way."
        }

        if input.isScreamed {
            return "Woah, chill out!"
        }

        if input.isQuestion {
            return "Sure."
        }

        return "Whatever."
    }
}
