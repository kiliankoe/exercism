struct Raindrops {
    let drops: Int

    init(_ drops: Int) {
        self.drops = drops
    }

    var sounds: String {
        var dropStr = ""
        if drops % 3 == 0 { dropStr += "Pling" }
        if drops % 5 == 0 { dropStr += "Plang" }
        if drops % 7 == 0 { dropStr += "Plong" }

        if dropStr.isEmpty { dropStr = "\(drops)" }
        return dropStr
    }
}
