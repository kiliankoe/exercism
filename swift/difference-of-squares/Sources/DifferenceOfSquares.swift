struct Squares {
    let count: Int

    init(_ count: Int) {
        self.count = count
    }

    var squareOfSums: Int {
        let sum = (1...count).reduce(0, +)
        return sum * sum
    }

    var sumOfSquares: Int {
        let squares = (1...count).map{$0*$0}
        return squares.reduce(0, +)
    }

    var differenceOfSquares: Int {
        return squareOfSums - sumOfSquares
    }
}
