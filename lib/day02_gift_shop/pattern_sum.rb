require_relative "pattern_finder"

data = File.read("#{__dir__}/input.txt")

puts "Part1 sum: #{PatternFinder.sum_patterns_in_data(1, data)}"
puts "Part2 sum: #{PatternFinder.sum_patterns_in_data(2, data)}"
