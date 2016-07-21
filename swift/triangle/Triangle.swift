struct Triangle {
    let sides: (Double, Double, Double)

    init(_ a: Double, _ b: Double, _ c: Double) {
        sides = (a, b, c)
    }

    private func sanityCheck() -> Bool {
        let (a, b, c) = sides

        // All sides must have a length > 0
        guard a > 0,
              b > 0,
              c > 0
            else { return false }

        // Sum of length of any two sides must exceed length of the other
        guard a + b > c,
              a + c > b,
              b + c > a
            else { return false }

        return true
    }

    enum Kind: String {
        case Equilateral, Isosceles, Scalene, ErrorKind
    }

    var kind: String {
        guard sanityCheck() else { return Kind.ErrorKind.rawValue }

        switch sides {
        case (let a, let b, let c) where a == b && b == c:
            return Kind.Equilateral.rawValue
        case (let a, let b, let c) where a != b && a != c && b != c:
            return Kind.Scalene.rawValue
        default:
            return Kind.Isosceles.rawValue
        }
    }
}
