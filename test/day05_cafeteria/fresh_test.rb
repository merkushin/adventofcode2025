require "minitest/autorun"
require "lib/day05_cafeteria/fresh"

class FreshTest < Minitest::Test
  def test_has_after_adding_range
    fr = Fresh.new

    fr.add_range "1-3"
    fr.add_range "5-7"

    assert fr.has?("1")
    assert fr.has?("2")
    assert fr.has?("6")
    assert_equal false, fr.has?("4")
    assert_equal false, fr.has?("8")
  end

  def test_count_all
    fr = Fresh.new

    fr.add_range "12-18"
    fr.add_range "3-5"
    fr.add_range "10-14"
    fr.add_range "16-20"

    assert_equal 14, fr.count_all
  end
end
