module GameOfLife
  class Services::BoardFiller
    def self.perform(board)
      board.each_position do |(row, column)|
        board.write(row, column, Models::Cell.new(randomized_intial_state))
      end
    end

    def self.randomized_intial_state
      rand(2).zero?
    end
  end
end
