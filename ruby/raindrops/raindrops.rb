class Raindrops

  RULES = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }

  def self.convert(num)
    factors = RULES.keys.select { |f| num % f == 0 }
    return factors.empty? ? num.to_s : factors.map { |n| RULES[n] }.join
  end
end

module BookKeeping
  VERSION = 2
end
