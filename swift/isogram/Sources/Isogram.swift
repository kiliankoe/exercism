import Foundation

enum Isogram {
    static func isIsogram(_ iso: String) -> Bool {
        let chars = iso
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "-", with: "")
            .lowercased()
            .characters
        return Set(chars).count == chars.count
    }
}
