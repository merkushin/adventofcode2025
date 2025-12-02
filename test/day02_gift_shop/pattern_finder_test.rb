require "minitest/autorun"
require "lib/day02_gift_shop/pattern_finder"

class PatternFinderTest < Minitest::Test

  def test_find_in_range_with_all_different_numbers
    finder = PatternFinder.new(1)
    assert_equal 0, finder.find_in(range: "1-10") 
  end

  def test_find_in_range_with_simplest_pattern
    finder = PatternFinder.new(1)

    assert_equal 1, finder.find_in(range: "11-11")
  end

  def test_find_in_range_with_twochar_pattern
    finder = PatternFinder.new(1)

    assert_equal 1, finder.find_in(range: "1212-1213")
  end

  def test_on_predefined_test_data
    test_data = {
      "11-22" => [ 11, 22 ],
      "95-115" => [ 99 ],
      "998-1012" => [ 1010 ],
      "1188511880-1188511890" => [ "1188511885" ],
      "222220-222224" => [ "222222" ], 
      "1698522-1698528" => [],
      "446443-446449" => [ 446446 ],
      "38593856-38593862" => [38593859],
      "565653-565659" => [],
      "824824821-824824827" => [],
      "2121212118-2121212124" => [],
    }
    finder = PatternFinder.new(1)

    test_data.each do |range, expected|
      found = []
      count = finder.find_in(range: range) do |number|
        found << number
      end
      assert_equal expected.size, count, 
        "Error with range #{range}, expected #{expected.inspect}, acutal #{found.inspect}"
    end
  end

  def test_sum_patterns_in_data
    test_data = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

    sum = PatternFinder.sum_patterns_in_data(1, test_data)

    assert_equal 1227775554, sum
  end

  def test_v2_sum_patterns_in_data
    test_data = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

    sum = PatternFinder.sum_patterns_in_data(2, test_data)

    assert_equal 4174379265, sum
  end
end

