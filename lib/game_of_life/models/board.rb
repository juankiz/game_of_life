module GameOfLife::Models
  class Board
    attr_reader :matrix, :max_row, :max_column

    DEFAULT_BOARD_SIZE = 10

    def initialize(width: DEFAULT_BOARD_SIZE, length: DEFAULT_BOARD_SIZE)
      @matrix = Array.new(width) { |_| Array.new(length) }
      @max_row = width.pred
      @max_column = length.pred
    end

    def each_position(&block)
      (0..max_row).each do |row|
        (0..max_column).each do |column|
          yield [row, column]
        end
      end
    end

    def read(row_postion, column_position)
      matrix[row_postion][column_position]
    end

    def write(row_postion, column_position, value)
      matrix[row_postion][column_position] = value
    end

    def neighbors_for(row_postion, column_position)
      neighbors = neighbor_range(row_postion, max_row).flat_map do |row|
        neighbor_range(column_position, max_column).map do |column|
          next if row_postion == row && column_position == column

          read(row, column)
        end
      end

      neighbors.compact
    end

    def advance!
      each_position do |(row, column, depth)|
        cell = read(row, column)
        cell.advance!
      end
    end

    def to_s
      matrix.each do |row|
        puts row.join(' ')
      end

      nil
    end

    private

    def neighbor_range(initial_postion, max_position)
      initial_range_value = initial_postion.positive? ? initial_postion.pred : 0
      last_range_value = max_position > initial_postion ? initial_postion.succ : max_position

      (initial_range_value..last_range_value)
    end
  end
end
