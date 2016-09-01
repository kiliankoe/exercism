class Prime
  def self.nth(n)
    raise ArgumentError unless n > 0

    primes = [2]
    count = 3

    while primes.count < n
      primes << count if count.prime?
      count += 1 # horribly inefficient... open-ended sieving somehow?
    end

    primes.last
  end
end

class Integer
  def prime?
    (2..Math.sqrt(self)).each do |num|
      return false if self % num == 0
    end
    true
  end
end
