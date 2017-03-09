import Foundation

struct Garden {
    enum Plant: String {
        case Grass = "G"
        case Clover = "C"
        case Radishes = "R"
        case Violets = "V"

        init?(char: Character) {
            self.init(rawValue: String(char))
        }
    }

    static let defaultChildren = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]

    let diagram: [String]
    let children: [String]

    init(_ diagram: String, children: [String] = Garden.defaultChildren) {
        self.diagram = diagram.components(separatedBy: "\n")
        self.children = children.sorted()
    }

    func plantsForChild(_ child: String) -> [Plant] {
        guard let idx = children.index(of: child) else { return [] }
        let index = Int(idx) * 2
        return diagram
            .map { $0[index..<index+2] }
            .map { Array<Character>($0.characters) }
            .flatMap { $0.map { Plant(char: $0)! } }
    }
}

// from http://stackoverflow.com/a/26775912/1843020
extension String {
    var length: Int {
        return self.characters.count
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
}
