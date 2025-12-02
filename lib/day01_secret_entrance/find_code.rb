require_relative "dial"
require_relative "dial2"

file = File.open("#{__dir__}/input.txt")
data = file.read

code = Dial.find_code(50, data)
puts "The code is: #{code}"

code2 = Dial2.find_code(50, data)
puts "The second code is: #{code2}"
