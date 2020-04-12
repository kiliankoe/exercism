import class Foundation.NSString

public struct Luhn {
    private let string: String

    public init(_ string: String) {
        self.string = string
    }

    var isValid: Bool {
        guard string.trimmingCharacters(in: .whitespaces) != "0" else { return false }
        do {
            return try string
                .filter { !$0.isWhitespace }
                .reversed()
                .enumerated()
                .map { idx, char in
                    guard var intValue = Int(String(char)) else { struct E: Error {}; throw E() }
                    if !idx.isMultiple(of: 2) {
                        intValue = intValue * 2
                    }
                    return intValue > 9 ? intValue - 9 : intValue
                }
                .reduce(0, +)
                .isMultiple(of: 10)
        } catch {
            return false
        }
    }
}
