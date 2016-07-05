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
        case let diff where diff < 0:
            return .abundant
        case let diff where diff > 0:
            return .deficient
        default:
            return .perfect
        }
    }
}

extension Int {
    var factors: [Int] {
        let upperBound = self / 2
        return (1...upperBound).filter { self % $0 == 0 }
    }
}
