require "minitest/autorun"
require "lib/day01_secret_entrance/dial2"

class Dial2Test < Minitest::Test
  def test_left_cross_once
    dial = Dial2.new(11)
    dial.rotate("L180")

    assert_equal 2, dial.zeroes
  end

  def test_find_code
    # with this sequence, starting with 50, we have 0 three times
    test_input = <<~DATA
      L68
      L30
      R48
      L5
      R60
      L55
      L1
      L99
      R14
      L82
      DATA

    assert_equal 6, Dial2.find_code(50, test_input)
  end

  def test_right_large
    dial = Dial2.new(50)
    dial.rotate("R1000")
    
    assert_equal 50, dial.current
    assert_equal 10, dial.zeroes
  end
end
