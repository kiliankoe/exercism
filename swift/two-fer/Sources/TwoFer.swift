enum TwoFer {
    static func twoFer(name: String? = nil) -> String {
        guard let name = name else {
            return "One for you, one for me."
        }
        return "One for \(name), one for me."
    }
}
