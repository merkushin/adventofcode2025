module MaxPair
  class << self
    def find_in(line:)
      first = line[...-1].chars.max
      index = line[...-1].chars.index(first)
      second = line[index + 1..].chars.max
      "#{first}#{second}"
    end

    def find_sum_in(lines:)
      lines.map { |line| find_in(line: line).to_i }.sum
    end
  end
end
