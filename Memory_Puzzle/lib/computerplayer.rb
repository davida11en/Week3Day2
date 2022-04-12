require_relative "card"
require_relative "board"
require_relative "game"
require_relative "humanplayer"


class ComputerPlayer

    def initialize(game)
        @matched_cards = []
        @known_cards = Hash.new()
        @game = game
    end

    def get_input

    end

    def prompt

    end

    def receive_revealed_card(position, value)
        @known_cards[position] = value
    end

    def receive_match(position, position)
        @matched_cards.push([position, position])
    end
end