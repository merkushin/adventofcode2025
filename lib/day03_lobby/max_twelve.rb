module MaxTwelve
  class << self
    def find_in(line:)
      max_first_index = line.size - 12

      first = line[..max_first_index].chars.max
      index = line[..max_first_index].chars.index(first)
      return line[index..] if index == max_first_index

      res = first
      rest = line[index+1..].chars.join

      11.times do |i|
        max_index = rest.size - 12 + i + 1
        n = rest[..max_index].chars.max
        index = rest[..max_index].chars.index(n)
        rest = rest[index+1..].chars.join
        res << n
      end

      res
    end

    def find_sum_in(lines:)
      lines.map { |line| find_in(line: line).to_i }.sum
    end
  end
end
