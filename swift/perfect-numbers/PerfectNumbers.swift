enum NumberClassification {
    case perfect
    case abundant
    case deficient
}

struct NumberClassifier {
    let number: Int

    var classification: NumberClassification {
        let factorSum = number.factors.reduce(0, combine: +)
        switch number - factorSum {
        case Int.min..<0:
            return .abundant
        case 1..<Int.max:
            return .deficient
        default:
            return .perfect
        }
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
