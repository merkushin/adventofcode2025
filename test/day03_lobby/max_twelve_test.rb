require "minitest/autorun"
require "lib/day03_lobby/max_twelve"

class MaxTwelveTest < Minitest::Test

  def test_remove_in_line
    test_data = {
      "987654321111111" => "987654321111",
      "811111111111119" => "811111111119",
      "234234234234278" => "434234234278",
      "818181911112111" => "888911112111",
    }

    test_data.each do |line, expected| 
      actual = MaxTwelve::find_in(line: line)
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

    actual = MaxTwelve::find_sum_in(lines:lines.split("\n"))

    assert_equal 3121910778619, actual
  end
end
