require_relative 'dial'

class Dial2 < Dial

  private

  def right(times)
    @current += times
    crosses, @current = @current.divmod(100)
    if crosses > 0 
      # no need to count zero here, it is made in the rotate method
      @zeroes += @current == 0 ? crosses - 1 : crosses
    end
    @current
  end

  def left(times)
    old_current = @current
    @current -= times
    crosses, @current = @current.divmod(100)
    if crosses.abs > 0
      # we get one extra cross when move from zero to negative
      @zeroes += old_current == 0 ? crosses.abs - 1 : crosses.abs
    end
    @current
  end
end

