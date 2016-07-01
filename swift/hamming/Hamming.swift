class Hamming {
    static func compute(_ base: String, against: String) -> Int? {
        guard base.characters.count == against.characters.count else { return nil }
        return base.characters.indices.map { base[$0] != against[$0] ? 1 : 0 }.reduce(0, combine: +)
    }
}
