require_relative "card"
require_relative "board"
require_relative "game"
require_relative "humanplayer"
require "byebug"

class ComputerPlayer

    def initialize(game)
        @matched_cards = []
        @known_cards = Hash.new()
        @game = game
    end

    def known_cards
        @known_cards
    end

    def empty_spaces
        empties = Array.new { [] }
        
        (0...@game.board.grid.length).each do |i|
            (0...(@game.board.grid.length)).each do |k|

                if !@game.board.isflipped?(i,k)
                    empties.push([i,k])

                end
            end
        end
        empties
    end

    def get_input()
        guess = self.check_match
        if guess == nil
            return self.random_guess
        else
            return guess
        end
    end

    def prompt

    end

    def receive_revealed_card(position, value)
        @known_cards[position] = value
    end

    def receive_match(position, position2)
        @matched_cards.push(position)
        @matched_cards.push(position2)
    end

    def random_guess
        empties = self.empty_spaces
        p empties
        possible_guesses = empties.select {|el| !@known_cards.keys.include?(el)}
        p possible_guesses
        return possible_guesses.sample
    end

    def check_match
        @known_cards.keys.each do |k, v|
            if !@matched_cards.include?(k)
                @known_cards.keys.each do |k2,v2|
                    if k != k2
                        if @known_cards[k] == @known_cards[k2]
                            if @game.previous_guess_pos == k
                                return k2
                            else
                                return k
                            end
                        end
                    end
                end
            end
        end
        return nil
    end
end