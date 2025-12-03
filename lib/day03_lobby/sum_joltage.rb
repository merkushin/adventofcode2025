require_relative "max_pair"
require_relative "max_twelve"

data = File.read("#{__dir__}/input.txt")
lines = data.split("\n")

puts "Find max pair: #{MaxPair::find_sum_in(lines: lines)}"
puts "Find max twelve: #{MaxTwelve::find_sum_in(lines: lines)}"
