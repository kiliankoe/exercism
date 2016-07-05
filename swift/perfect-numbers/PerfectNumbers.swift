enum NumberClassification {
    case perfect
    case abundant
    case deficient

    init(for number: Int) {
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
}

struct NumberClassifier {
    let number: Int

    var classification: NumberClassification {
        return NumberClassification(for: number)
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
