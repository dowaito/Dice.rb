require "./Dice.rb"
require "test/unit"

class TestDice < Test::Unit::TestCase

  def is_valid_d6_range?
    [1..100].each do
      x = 1.d6
      if x < 1 or x > 6
        return false
      end
    end
    true
  end

  def testD6Range
    assert(is_valid_d6_range?, "Dice rolls out of range")
  end
end
