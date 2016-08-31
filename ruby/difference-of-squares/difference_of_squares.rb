class Squares
  def initialize(num)
    @num = num
  end

  def square_of_sum
    (1..@num).reduce(0, :+) ** 2
  end

  def sum_of_squares
    (1..@num).map { |n| n ** 2 }.reduce(0, :+)
  end

  def difference
    (sum_of_squares - square_of_sum).abs
  end
end

module BookKeeping
  VERSION = 3
end
