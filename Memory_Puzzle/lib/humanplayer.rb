require_relative "card"
require_relative "board"
require_relative "computerplayer"
require_relative "game"


class HumanPlayer


    def initialize(game)
        ##@previous_guess = nil
        ##@matched_cards = []
        ##@known_cards = Hash.new()
        @game = game
    end

    def get_input
        p "Please input a position using two numbers with a space between '1 2'"
        pos = gets.chomp.split(" ").map { |int| int.to_i }
    end

    def prompt

    end

    def receive_revealed_card

    end

    def receive_match

    end
end