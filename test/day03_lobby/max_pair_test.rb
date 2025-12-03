require "minitest/autorun"
require "lib/day03_lobby/max_pair"

class MaxPairText < Minitest::Test

  def test_find_in_line
    test_data = {
      "987654321111111" => "98",
      "811111111111119" => "89",
      "234234234234278" => "78",
      "818181911112111" => "92",
    }

    test_data.each do |line, expected| 
      actual = MaxPair::find_in(line: line)
      assert_equal expected, actual, 
        "For line #{line}: expected `#{expected}`, got `#{actual}`"
    end
  end

  def test_find_sum_in_lines
    lines = <<~DATA
      987654321111111
      811111111111119
      234234234234278
      818181911112111
      DATA

    acutal = MaxPair::find_sum_in(lines:lines.split("\n"))

    assert_equal 357, acutal
  end
end
