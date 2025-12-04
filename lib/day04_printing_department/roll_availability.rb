class RollAvailability
  def initialize(field)
    @matrix = field_to_array(field)
  end

  def find
    count_available = 0
    @matrix.each_with_index do |row, i|
      row.each_with_index do |col, j|
        next unless roll?(i, j)
        next if has_four_neighbors?(i, j)
        count_available += 1
      end
    end
    count_available
  end

  private

  def roll?(i, j)
    @matrix[i][j] == "@"
  end

  def has_four_neighbors?(i, j)
    neighbors = 0
    [-1, 0, 1].each do |di|
      [-1, 0, 1].each do |dj|
        next if di == 0 && dj == 0
        next if i + di < 0 || i + di >= @matrix.size
        next if j + dj < 0 || j + dj >= @matrix[0].size

        neighbors += 1 if @matrix[i+di][j+dj] == "@"

        return true if neighbors == 4
      end
    end

    false
  end

  def field_to_array(field)
    field.split("\n").map { |line| line.split("") }
  end

end

