require "minitest/autorun"
require "lib/day05_cafeteria/fresh_counter"

class FreshCounterTest < Minitest::Test
  def test_count
    fc = FreshCounter.new
    fc.load <<~DATA
      1-3
      5-7

      2
      4
      6
      7
      8
      DATA

    assert_equal 3, fc.count
  end
end
