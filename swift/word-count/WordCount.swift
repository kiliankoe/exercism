import Foundation

struct WordCount {
    let words: String

    func count() -> [String: Int] {
        let words = self.words.lowercased().removingPunctuation()
        let singleWords = words.characters.split(separator: " ").map(String.init)

        var wordCount = [String: Int]()
        singleWords.forEach {
            let count = wordCount[$0] ?? 0
            wordCount[$0] = count + 1
        }
        return wordCount
    }
}

extension String {
    func removingPunctuation() -> String {
        let allowedChars = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz".characters)
        let str = self.characters.filter { allowedChars.contains($0) }
        return String(str)
    }
}
