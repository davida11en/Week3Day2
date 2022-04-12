require_relative "board"
require_relative "game"
require_relative "humanplayer"
require_relative "computerplayer"

class Card

    def initialize(face_value)
        @face = face_value
        @flipped = false
    end

    def flipped
        @flipped
    end

    def face
        @face
    end

    def hide 
        @flipped = false
    end

    def reveal
        if @flipped == false
            @flipped = true 
            return @face
        end
    end

    def to_s
        @face.to_s
    end

    def ==(other_card) 
        return self.to_s == other_card.to_s
    end

end