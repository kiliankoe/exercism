enum NumberClassifier {
    case perfect, abundant, deficient

    init(number: Int) {
        let factorSum = number.factors.reduce(0, combine: +)
        switch number - factorSum {
        case Int.min..<0:
            self = .abundant
        case 1..<Int.max:
            self = .deficient
        default:
            self = .perfect
        }
    }

    // Only really needed since the tests are looking for a property,
    // we could just use `self` otherwise.
    var classification: NumberClassifier {
        return self
    }
}

extension Int {
    var factors: [Int] {
        if self == 0 { return [] }
        if abs(self) == 1 { return [1] }
        let upperBound = abs(self) / 2
        return (1...upperBound).filter { self % $0 == 0 }
    }
}
