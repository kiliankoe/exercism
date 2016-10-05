module Hamming
  def self.compute(strand_a : String, strand_b : String)
    raise ArgumentError.new unless strand_a.chars.size == strand_b.chars.size

    strand_a.each_char.with_index.count do |char, idx|
      char != strand_b[idx]
    end
  end
end
