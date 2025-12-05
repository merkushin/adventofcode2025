require_relative "fresh_counter"

data = File.read "#{__dir__}/input.txt"

counter = FreshCounter.new
counter.load(data)

puts "Fresh count: #{counter.count}"
puts "Count all fresh: #{counter.count_all}"
