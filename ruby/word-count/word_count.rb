class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.scan(/[\w']+/).map { |e| e.downcase.gsub(/[^a-z0-9']/, '') }
    words.reject! { |e| e == '' }
    words.map! { |e| e.gsub(/^["']|["']$/, '') }
    words.reduce(Hash.new(0)) { |a, e| a[e] += 1; a }
  end
end

module BookKeeping
  VERSION = 1
end
