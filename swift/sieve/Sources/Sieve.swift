struct Sieve {
    let upperBound: Int

    init(_ upperBound: Int) {
        self.upperBound = upperBound
    }

    var primes: [Int] {
        var primeCandidates = Array<Int>(2...upperBound)
        var primes = [Int]()

        while true {
            guard primeCandidates.count > 0 else { break }

            let current = primeCandidates.removeFirst()
            primes.append(current)

            primeCandidates = primeCandidates.filter {
                $0 % current != 0
            }
        }

        return primes
    }
}
