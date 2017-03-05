import Foundation

extension String {
    fileprivate var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }

    fileprivate var isQuestion: Bool {
        return self.hasSuffix("?")
    }

    fileprivate var isShouted: Bool {
        return self == self.uppercased() && self != self.lowercased()
    }
}

enum Bob {
    static func hey(_ input: String) -> String {
        if input.isBlank {
            return "Fine, be that way."
        }

        if input.isShouted {
            return "Woah, chill out!"
        }

        if input.isQuestion {
            return "Sure."
        }

        return "Whatever."
    }
}
