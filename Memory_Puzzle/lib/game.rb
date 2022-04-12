require_relative "card"
require_relative "board"
require_relative "humanplayer"
require_relative "computerplayer"

class Game


    def initialize(size)
        @board = Board.new(size)
        @previous_guess = nil
        @player = HumanPlayer.new(self)
    end


    def play
        until @board.won? 
            self.print
            pos = @player.get_input
            self.make_guess(pos)
            self.print
        end
    end
    
    def make_guess(position)
        check = @board.reveal(position)
        if check == 1
            p "That is already revealed"
        else
            if @previous_guess == nil
                @previous_guess = @board[position]
            else
                if @previous_guess == @board[position]
                    @previous_guess = nil
                else
                    p "This is incorrect"
                    sleep(2)
                    system("clear")
                    @previous_guess.hide
                    @board[position].hide
                    @previous_guess = nil
                end
            end
        end
    end

    def print
        system("clear")
        @board.render
    end

end