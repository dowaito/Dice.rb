require "./Dice.rb"
require "test/unit"

class TestDice < Test::Unit::TestCase

  def test_d6_spread
    assert_equal(3, get_d6_average, "Dice rolls outside of expected average")
  end

  def test_d6_Range
    assert(rolls_in_range?, "Dice rolls out of range")
  end

  def test_d20_range
    assert(rolls_in_range?("d20"), "Dice rolls out of range")
  end

#- Helper Methods -----------------------------------

  def rolls_in_range?(die="d6")
    (1..100).each do
      x = 1.send(die)
      return false if x < 1 or x > die[1, die.length].to_i
    end
    true
  end

  def get_d6_average
    (1..100).inject(){|sum| sum += 1.d6} / 100
  end

end
