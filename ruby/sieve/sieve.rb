class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] if @limit < 2
    (2..@limit).reduce([]) do |primes, num|
      divisors = primes.select { |p| num % p == 0 }
      primes << num if divisors.count == 0
      primes
    end
  end
end
