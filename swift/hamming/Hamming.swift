class Hamming {
    static func compute(_ base: String, against: String) -> Int? {
        guard base.characters.count == against.characters.count else { return nil }
        return zip(base.characters, against.characters).filter(!=).count
    }
}
