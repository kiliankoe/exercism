struct Allergies {

    enum type: Int {
        case eggs = 1
        case peanuts = 2
        case shellfish = 4
        case strawberries = 8
        case tomatoes = 16
        case chocolate = 32
        case pollen = 64
        case cats = 128
    }

    let identifier: Int

    init(_ id: Int) {
        identifier = id
    }

    func hasAllergy(_ type: Allergies.type) -> Bool {
        return identifier.fittingMultiplesOfTwo.contains(type.rawValue)
    }
}

extension Int {
    var fittingMultiplesOfTwo: [Int] {
        var current = self
        let values = [128, 64, 32, 16, 8, 4, 2, 1]
        return values.filter {
            if $0 <= current {
                current -= $0
                return true
            }
            return false
        }
    }
}
