require "./Dice.rb"
require "test/unit"

class TestDice < Test::Unit::TestCase

  def is_valid_d6_range?
    (1..100).each do
      x = 1.d6
      if x < 1 or x > 6
        return false
      end
    end
    true
  end

  def get_average(spread)
    total_rolls = 0
    values = {}
    # get values
    spread.each do |(k,v)|
      values[k] = k * v
      total_rolls += v
    end
    # sum values
    sum = values.values.inject(:+)
    sum / total_rolls
  end

  def testSpread
    spread = {}
    (1..100).each do
      x = 1.d6
      spread.has_key?(x) ? spread[x] += 1 : spread[x] = 1
    end

    assert_equal(3, get_average(spread), 
                  "Dice rolls outside of expected average")
  end

  def testD6Range
    assert(is_valid_d6_range?, "Dice rolls out of range")
  end

end
