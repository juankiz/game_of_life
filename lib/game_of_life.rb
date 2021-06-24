require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.setup

module GameOfLife
  def self.start
    board = Models::Board.new
    Services::BoardFillerService.perform(board)
    board.to_s
  end
end
