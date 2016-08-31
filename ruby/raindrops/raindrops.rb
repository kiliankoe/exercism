class Raindrops
  def self.convert(num)
    factors = factors(num)

    return num.to_s unless includes_valid_factors?(factors)

    nums = factors.reject { |n| n != 3 && n != 5 && n != 7 }
    nums = nums.uniq
    words = nums.map { |n| convert_single(n) }
    words.join
  end

  def self.factors(num)
    # FIXME: Improve this func, it's rather ugly :/
    some_primes = [2,3,5,7,11,13,17,19,23,29]
    factors = []
    while num > 1
      some_primes.each do |prime|
        if num % prime == 0
          factors << prime
          num /= prime
          break
        end
      end
    end
    factors
  end

  def self.includes_valid_factors?(factors)
    factors.include?(3) || factors.include?(5) || factors.include?(7)
  end

  def self.convert_single(num)
    return 'Pling' if num == 3
    return 'Plang' if num == 5
    return 'Plong' if num == 7
  end
end

module BookKeeping
  VERSION = 2
end
