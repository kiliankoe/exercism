class Complement
  @@transcription = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  def self.of_dna(dna)
    return '' unless dna =~ /^([ACGT]+)$/
    dna.chars.map { |c| @@transcription[c] }.join
  end
end

module BookKeeping
  VERSION = 4
end
