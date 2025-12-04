require_relative "roll_availability"
require_relative "roll_mover"

field = File.read("#{__dir__}/input.txt")

puts "Rolls initially available for moving: #{RollAvailability.new(field).find}"
puts "Rolls to be moved in the end: #{RollMover.move_all_available(field)}"
