class SumOfMultiples {
    static func toLimit(_ limit: Int, inMultiples multiples: [Int]) -> Int {
        return (0..<limit)
            .filter{$0.isMultipleOfOne(of: multiples)}
            .reduce(0, combine: +)
    }
}

extension Int {
    func isMultipleOfOne(of: [Int]) -> Bool {
        guard self != 0 else { return false }
        return of.filter {
            guard $0 != 0 else { return false }
            return abs(self) % $0 == 0
        }.count > 0
    }
}
