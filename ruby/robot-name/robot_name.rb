class Robot
  attr_accessor :name

  @used_names = []

  def initialize
    @name = Robot.generate_name
  end

  def reset
    @name = Robot.generate_name
  end

  def self.generate_name
    letters = ('A'..'Z').to_a.sample(2).join
    digits = rand(100..999)
    name = "#{letters}#{digits}"
    name = generate_name if @used_names.include?(name)
    @used_names << name
    name
  end
end

module BookKeeping
  VERSION = 2
end
