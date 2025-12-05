class Fresh
  def initialize
    @ids = Set.new
  end 

  def add_range(r)
    beginning, ending = r.split("-").map(&:to_i)
    @ids.add(beginning..ending)
  end

  def has?(id)
    @ids.each do |r| 
      return true if r.include?(id.to_i) 
    end

    false
  end

  def count_all
    ranges = @ids.to_a.sort_by { |r| r.begin }
    ranges = combine_all_ranges(ranges)
    ranges.map { |r| r.size }.sum
  end

  private

  def combine_all_ranges(ranges)
    combined = []

    current = ranges.first
    ranges.each do |r|
      if r.begin <= current.end
        current = combine_ranges(current, r)
      else
        combined << current
        current = r
      end
    end
    combined << current

    combined 
  end

  def combine_ranges(a, b)
    [a.begin, b.begin].min..[a.end, b.end].max
  end
end
