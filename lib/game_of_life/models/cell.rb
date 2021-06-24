module GameOfLife::Models
  class Cell
    def initialize(alive)
      @alive = alive
    end

    def alive?
      @alive
    end

    def advance!
      @alive = @next_state
    end

    def live!
      @next_state = true
    end

    def die!
      @next_state = false
    end

    def to_s
      alive? ? '✅' : '❌'
    end
  end
end
