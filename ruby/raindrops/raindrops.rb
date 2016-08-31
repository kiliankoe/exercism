class Raindrops

  RULES = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong',
  }

  def self.convert(num)
    divisors = RULES.keys.select { |f| num % f == 0 }
    divisors.empty? ? num.to_s : divisors.map { |n| RULES[n] }.join
  end
end

module BookKeeping
  VERSION = 2
end
