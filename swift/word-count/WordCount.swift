import Foundation

struct WordCount {
    let words: String

    func count() -> [String: Int] {
        let words = self.words.lowercased().replacingOccurrences(of: ",", with: "")
        let singleWords = words.characters.split(separator: " ").map(String.init)

        var wordCount = [String: Int]()
        singleWords.forEach {
            let count = wordCount[$0] ?? 0
            wordCount[$0] = count + 1
        }
        return wordCount
    }
}
