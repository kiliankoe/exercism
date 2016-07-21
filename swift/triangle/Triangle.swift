struct Triangle {
    let sides: (Double, Double, Double)

    init(_ a: Double, _ b: Double, _ c: Double) {
        sides = (a, b, c)
    }

    private func sanityCheck() -> Bool {
        let (a, b, c) = sides

        // All sides must have a size
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

    var kind: String {
        guard sanityCheck() else { return "ErrorKind" }

        switch sides {
        case (let a, let b, let c) where a == b && b == c:
            return "Equilateral"
        case (let a, let b, let c) where a != b && a != c && b != c:
            return "Scalene"
        default:
            return "Isosceles"
        }
    }
}
