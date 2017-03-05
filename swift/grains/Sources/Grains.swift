import Foundation

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

        return UInt64(pow(2, Double(grains - 1)))
    }

    static var total: UInt64 {
        return 18_446_744_073_709_551_615
    }
}
