enum Grains {
    enum GrainsError: Error {
        case inputTooHigh(String)
        case inputTooLow(String)

        static func message(input: Int) -> String {
            return "Input[\(input)] invalid. Input should be between 1 and 64 (inclusive)"
        }
    }

    static func square(_ grains: Int) throws -> UInt64 {
        guard grains <= 64 else {
            throw GrainsError.inputTooHigh(GrainsError.message(input: grains))
        }
        guard grains >= 1 else {
            throw GrainsError.inputTooLow(GrainsError.message(input: grains))
        }

        if grains == 1 {
            return 1
        }

        if grains == 64 {
            // Can't find a good solution to circumvent overflowing :/
            return 9_223_372_036_854_775_808
        }

        return UInt64(2 << (grains - 2))
    }

    static var total: UInt64 {
        return 18_446_744_073_709_551_615
    }
}
