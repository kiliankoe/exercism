class Complement
  TRANSCRIPTIONS = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }

  def self.of_dna(dna)
    rna = dna.chars.map { |c| TRANSCRIPTIONS[c] }
    rna.include?(nil) ? '' : rna.join
  end
end

module BookKeeping
  VERSION = 4
end
