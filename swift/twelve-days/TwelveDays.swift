class TwelveDaysSong {
    static func verse(_ idx: Int) -> String {
        guard idx > 0 else { return "" }
        var verse = "On the \(songData[idx-1].0) day of Christmas my true love gave to me,"
        for i in (0..<idx).reversed() {
            if i == 0 && idx > 1 {
                verse.append(" and")
            }
            verse.append(songData[i].1)
        }
        verse.append("\n")
        return verse
    }

    static func verses(_ from: Int, _ to: Int) -> String {
        guard from > 0 && to <= 12 else { return "" }
        let verses = (from...to)
            .map{verse($0)}
            .joined(separator: "\n")
        return "\(verses)\n"
        // Returning verses without the extra `\n` at the end makes a lot
        // more sense, but the tests are expecting it for some reason...
    }

    static func sing() -> String {
        return verses(1, songData.count)
    }

    private static let songData = [
        ("first", " a Partridge in a Pear Tree."),
        ("second", " two Turtle Doves,"),
        ("third", " three French Hens,"),
        ("fourth", " four Calling Birds,"),
        ("fifth", " five Gold Rings,"),
        ("sixth", " six Geese-a-Laying,"),
        ("seventh", " seven Swans-a-Swimming,"),
        ("eighth", " eight Maids-a-Milking,"),
        ("ninth", " nine Ladies Dancing,"),
        ("tenth", " ten Lords-a-Leaping,"),
        ("eleventh", " eleven Pipers Piping,"),
        ("twelfth", " twelve Drummers Drumming,")
    ]
}
