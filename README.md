# JC's Game of Life Implementation

## Introduction

Start an `irb` session at the project root and then write:
```ruby
require_relative 'lib/game_of_life'

game = GameOfLife.start
game.perform
```

You can call `game.perform` as many times as you want to advance the game, one step at a time.
