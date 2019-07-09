class Player # create a player entity(player1 and player2)
    def initialize(name)  # set initial stats
        @name = name
    end    
    attr_reader :name
end