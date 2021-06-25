require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.setup

module GameOfLife
  def self.start
    board = Models::Board.new
    Services::BoardFiller.perform(board)
    Services::TimeTicker.new(board)
  end
end
