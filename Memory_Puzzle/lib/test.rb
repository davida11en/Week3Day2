require_relative "card"
require_relative "board"
require_relative "game"
require_relative "humanplayer"
require_relative "computerplayer"

g = Game.new(4)
g.play()