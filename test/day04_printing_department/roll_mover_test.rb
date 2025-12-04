require "minitest/autorun"
require "lib/day04_printing_department/roll_mover"

class RollMoverTest < Minitest::Test
  def test_move
    field = <<~FIELD
      ..@@.@@@@.
      @@@.@.@.@@
      @@@@@.@.@@
      @.@@@@..@.
      @@.@@@@.@@
      .@@@@@@@.@
      .@.@.@.@@@
      @.@@@.@@@@
      .@@@@@@@@.
      @.@.@@@.@.
      FIELD

    actual = RollMover.move_all_available(field)

    assert_equal 43, actual
  end
end 
