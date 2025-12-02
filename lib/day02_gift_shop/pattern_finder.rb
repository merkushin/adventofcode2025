class PatternFinder
  def self.sum_patterns_in_data(version, string)
    finder = new(version)
    string.split(",").sum do |range|
      range_sum = 0
      finder.find_in(range: range) do |number|
        range_sum += number
      end
      range_sum
    end
  end

  def initialize(version)
    @version = version
  end
  
  def find_in(range:)
    r = range_from(string: range)
    numbers_with_patterns = 0
    r.each do |number|
      if pattern?(number)
        numbers_with_patterns += 1

        yield number if block_given?
      end
    end
    numbers_with_patterns
  end

  private

  def range_from(string:)
    beginning, ending = string.split("-")
    beginning.to_i..ending.to_i
  end

  def pattern?(number)
    return false if all_chars_are_different?(number)

    if @version == 2
      return true if consists_of_same_chars?(number)
      has_repeated_sequence?(number)
    else
      length = number.to_s.size
      return true if consists_of_same_chars?(number) if length.even?
      consists_of_two_repeated_parts?(number)
    end
  end

  def all_chars_are_different?(number)
    number.to_s.chars.uniq.size == number.to_s.size
  end

  def consists_of_same_chars?(number)
    first_character = number.to_s.chars.first
    length = number.to_s.size
    first_character * length == number.to_s
  end

  def consists_of_two_repeated_parts?(number)
    length = number.to_s.size
    return false if length % 2 != 0

    first_part = number.to_s[0...length / 2]
    second_part = number.to_s[length / 2..]

    first_part == second_part
  end

  def has_repeated_sequence?(number)
    length = number.to_s.size
    2.upto(number.to_s.chars.size / 2) do |i|
      repeats, remainder = length.divmod(i)
      next if remainder > 0 or repeats < 2
      return true if number.to_s[0...i] * repeats == number.to_s
    end

    false
  end
end
