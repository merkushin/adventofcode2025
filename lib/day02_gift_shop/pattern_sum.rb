require_relative "pattern_finder"

part1_sum = PatternFinder.sum_patterns_in_data(1, File.read("#{__dir__}/input.txt"))
puts "Part1 sum: #{part1_sum}"

part2_sum = PatternFinder.sum_patterns_in_data(2, File.read("#{__dir__}/input.txt"))
puts "Part2 sum: #{part2_sum}"
