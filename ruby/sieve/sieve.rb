class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] if @limit < 2
    primes = []
    nums = (2..@limit).to_a
    while nums.count >= 1
      current_prime = nums.first
      primes << current_prime
      nums.each { |n| nums.delete(n) if n % current_prime == 0 }
    end
    primes
  end
end
