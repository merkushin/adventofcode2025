class RollMover
  attr_reader :result

  def self.move_all_available(field, total = 0)
    field = field_to_array(field) if field.is_a? String

    remover = RollMover.new(field)
    count = remover.find_and_move

    count > 0 ? move_all_available(remover.result, total + count) : total
  end

  def initialize(matrix)
    @matrix = matrix
    @result = matrix
  end

  def find_and_move
    count_available = 0
    @matrix.each_with_index do |row, i|
      row.each_with_index do |col, j|
        next unless roll?(i, j)
        next if has_four_neighbors?(i, j)
        count_available += 1
        @result[i][j] = "." 
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

        neighbors += 1 if roll?(i+di, j+dj)

        return true if neighbors == 4
      end
    end

    false
  end

  def self.field_to_array(field)
    field.split("\n").map { |line| line.split("") }
  end

end

