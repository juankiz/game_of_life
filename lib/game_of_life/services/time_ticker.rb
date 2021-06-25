module GameOfLife
  class Services::TimeTicker
    ALIVE_NEIGHBORS_THRESHOLD = [2, 3]

    attr_reader :board

    def initialize(board)
      @board = board
    end

    def perform
      board.each_position do |(row, column, depth)|
        cell = board.read(row, column)
        if keep_alive?(row, column)
          cell.live!
        else
          cell.die!
        end
      end

      board.advance!
      board.to_s
    end

    private

    def keep_alive?(row, column)
      ALIVE_NEIGHBORS_THRESHOLD.include? board.neighbors_for(row, column).count(&:alive?)
    end
  end
end
