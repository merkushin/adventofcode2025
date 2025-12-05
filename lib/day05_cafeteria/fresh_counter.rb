require_relative "fresh"

class FreshCounter
  def initialize
    @fresh = Fresh.new
    @ids = []
  end

  def load(data)
    load_fresh = true
    data.split("\n").each do |line|
      if line.strip == ""
        load_fresh = false
        next
      end

      @fresh.add_range(line) if load_fresh
      @ids << line.to_i unless load_fresh
    end
  end

  def count
    @ids.select { |id| @fresh.has?(id) }.count
  end

  def count_all
    @fresh.count_all
  end

end
