class Hamming
  def self.compute(strand_a, strand_b)
    raise ArgumentError unless strand_a.length == strand_b.length

    strand_a.each_char.with_index.count do |char, idx|
      char != strand_b[idx]
    end
  end
end

module BookKeeping
  VERSION = 3
end
