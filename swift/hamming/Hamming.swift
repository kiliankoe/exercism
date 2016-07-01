class Hamming {
    static func compute(_ first: String, against second: String) -> Int? {
        guard first.characters.count == second.characters.count else {
            // Hamming distance is undefined for strands of different length
            return nil
        }

        return first.characters.enumerated().map { (idx, char) -> Int in
            let secondChar = second[second.index(second.startIndex, offsetBy: idx)]
            return char != secondChar ? 1 : 0
        }.reduce(0, combine: +)
    }
}
