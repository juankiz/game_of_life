module GameOfLife::Services
  class TimeTicker
    ALIVE_NEIGHBORS_THRESHOLD = [2, 3]

    attr_reader :board

    def initialize(board)
      @board = board
    end

    def perform
      board.each_position do |(row, column)|

      end
    end

    private

    def keep_alive?(row, colum)
      ALIVE_NEIGHBORS_THRESHOLD.include? board.neighbors_for(row, column).count(&:alive?)
    end
  end
end
