class Dial
  attr_reader :current
  attr_reader :zeroes

  def self.find_code(initial, data)
    dial = new(initial)
    data.split("\n").each do |movement|
      dial.rotate(movement)
    end
    dial.zeroes
  end

  def initialize(value = 0)
    @current = value
    @zeroes = 0
  end

  def rotate(movement)
    direction = movement[0...1]
    times = movement[1..]

    case direction
    when "R" 
      right(times.to_i)
    when "L" 
      left(times.to_i)
    end

    @zeroes += 1 if @current == 0
    @current
  end

  private

  def right(times)
    @current += times
    @current %= 100
  end

  def left(times)
    @current -= times
    @current %= 100
  end
end

