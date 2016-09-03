module RunLengthEncoding
  Struct.new('CharCount', :char, :count)

  def self.encode(input)
    # turn input into array of CharCounts counting each char
    initial = [Struct::CharCount.new(input.chars.first, 0)]
    counts = input.chars.reduce(initial) do |counts, char|
      if counts.last.char == char
        counts.last.count += 1
      else
        counts << Struct::CharCount.new(char, 1)
      end
      counts
    end
    # turn array of CharCounts into final encoded string
    counts.reduce('') do |encoded, pair|
      encoded << pair.count.to_s if pair.count != 1
      encoded << pair.char
    end
  end

  def self.decode(input)
    pairs = input.scan(/(\d+|)(.)/)
    pairs.reduce('') do |encoded, pair|
      pair[0] = 1 if pair[0] == ''
      pair[0].to_i.times { encoded << pair[1] }
      encoded
    end
  end
end

module BookKeeping
  VERSION = 2
end
