require 'set'

module Pangram
  def self.is_pangram?(str)
    return false if str.empty?

    letters = "abcdefghijklmnopqrstuvwxyz".chars.to_set
    str.downcase.chars.to_set.proper_superset?(letters)
  end
end

module BookKeeping
  VERSION = 2
end
