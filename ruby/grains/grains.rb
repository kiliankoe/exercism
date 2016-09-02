class Grains
  def self.square(num)
    return 1 if num == 1
    2**(num - 1)
  end

  def self.total
    (1..64).reduce(0) { |a, e| a + Grains.square(e) }
  end
end
