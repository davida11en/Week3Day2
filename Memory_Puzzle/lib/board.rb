require_relative "card"
require_relative "game"
require_relative "humanplayer"
require_relative "computerplayer"
require "byebug"

class Board 
    attr_reader :size, :grid

    def initialize(size)
        @grid = Array.new(size) { Array.new(size)}
        @size = size
        self.populate()
    end

    def populate
        numofpairs = (@size * @size) / 2
        usedvals = []
        
        while usedvals.length < numofpairs
            value = rand(1..@size * @size)
            if !usedvals.include?(value)
                empties = self.empty_spaces
                fill_spots = empties.sample(2)
                fill_spots.each do |subarr|
                    @grid[subarr[0]][subarr[1]] = Card.new(value)
                end
                usedvals.push(value)
            end
            #debugger
        end
            # randx = rand(0...@size) 
            # randy = rand(0...@size) 
            
            # if @grid[randx][randy] == nil
            #     #p randx + " " + randy
            #     randx2 = rand(0...@size)
            #     randy2 = rand(0...@size) 

            #     if @grid[randx2][randy2] == nil && (randx != randx2 || randy != randy2)
            #         value = rand(1..(@size * @size))
            #         if !usedvals.include?(value)
            #             @grid[randx][randy] = Card.new(value)
            #             @grid[randx2][randy2] = Card.new(value)
            #             usedvals.push(value)
            #         end
            #     end
            # end

    end

    def render
        @grid.each do |row|
            rowstring = ''
            row.each do |card|
                if card.flipped
                    rowstring += card.to_s
                else
                    rowstring += ' _ '
                end
            end
            p rowstring
        end
    end
    
    def won?
        return true if @grid.flatten.all? { |card| card.flipped }
        return false
    end

    def empty_spaces
        empties = Array.new { [] }

        (0...@size).each do |i|
            (0...@size).each do |k|
                if @grid[i][k] == nil
                    empties.push([i,k])
                end
            end
        end
        empties
    end

    def reveal(guessed_pos)
        if !self[guessed_pos].flipped 
            guess_val = self[guessed_pos].reveal
            self.render
            return guess_val
        else 
            return 1
        end
    end

    def isflipped?(idx1, idx2)
        testcard = @grid[idx1][idx2] 
        testcard.flipped
    end

    def [](position)
        @grid[position[0]][position[1]] 
     end
end