class Hamming
  def self.compute(a, b)
    if a.length != b.length
      raise ArgumentError
    elsif a == b
      return 0
    end

    diff = 0
    pairs = a.split("").zip(b.split(""))
    pairs.each do |pair|
      if pair[0] != pair[1]
        diff += 1
      end
    end

    return diff
  end
end

module BookKeeping
  VERSION = 3
end
