class Gigasecond
  def self.from(seconds)
    seconds + 1_000_000_000
  end
end

module BookKeeping
  VERSION = 3
end
