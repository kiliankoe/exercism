struct Allergies {
    enum type: UInt {
        case eggs = 1
        case peanuts = 2
        case shellfish = 4
        case strawberries = 8
        case tomatoes = 16
        case chocolate = 32
        case pollen = 64
        case cats = 128
    }

    let identifier: UInt

    init(_ id: UInt) {
        identifier = id
    }

    func hasAllergy(_ type: Allergies.type) -> Bool {
        return identifier & type.rawValue != 0
    }
}
