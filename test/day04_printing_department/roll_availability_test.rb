require "minitest/autorun"
require "lib/day04_printing_department/roll_availability"

class RollAvailabilityTest < Minitest::Test

  def test_find
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

    ra = RollAvailability.new(field)

    assert_equal 13, ra.find
  end

end
