struct Sieve {
    let upperBound: Int

    init(_ upperBound: Int) {
        self.upperBound = upperBound
    }

    var primes: [Int] {
        return sieve(Array(2...upperBound))
    }

    private func sieve(_ list: [Int]) -> [Int] {
        guard !list.isEmpty else { return [] }
        let (head, tail) = (list[0], list[1..<list.count])
        return [head] + sieve(tail.filter { $0 % head != 0 })
    }
}
