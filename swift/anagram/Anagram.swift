struct Anagram {
    let word: String

    func match(_ wordList: [String]) -> [String] {
        return wordList.filter { testWord in
            guard testWord.lowercased() != self.word.lowercased() else { return false }
            return self.word.charOccurrences == testWord.charOccurrences
        }
    }
}

extension String {
    var charOccurrences: [Character: Int] {
        var occ = [Character: Int]()
        self.characters.forEach {
            let val = occ[$0.lowercased()] ?? 0
            occ[$0.lowercased()] = val + 1
        }
        return occ
    }
}

extension Character {
    func lowercased() -> Character {
        return Character(String(self).lowercased())
    }
}
