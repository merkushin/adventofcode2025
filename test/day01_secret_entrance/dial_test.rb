require "minitest/autorun"
require "lib/day01_secret_entrance/dial"

class DialTest < Minitest::Test
  # def test_current_initialized_with_number
  #   dial = Dial.new(11)
  #
  #   assert_equal 11, dial.current
  # end
  #
  # def test_rotate_right
  #   dial = Dial.new
  #
  #   assert_equal 68, dial.rotate("R68")
  # end
  #
  # def test_rotate_left
  #   dial = Dial.new(50)
  #
  #   assert_equal 82, dial.rotate("L68")
  # end
  #
  # def test_rotate_changes_current
  #   dial = Dial.new
  #   dial.rotate("L98")
  #
  #   assert_equal 2, dial.current
  # end
  #
  # def test_find_code
  #   # with this sequence, starting with 50, we have 0 three times
  #   test_input = <<~DATA
  #     L68
  #     L30
  #     R48
  #     L5
  #     R60
  #     L55
  #     L1
  #     L99
  #     R14
  #     L82
  #     DATA
  #
  #   assert_equal 3, Dial.find_code(50, test_input)
  # end
end
