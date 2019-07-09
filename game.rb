class Game # hold game state
    def initialize  # set initial stats
        @p1_lives = 3
        @p2_lives = 3
        @lowest_score = 3
    end    
    def prompt_player_names # prompt players for names
        puts "How art thou known in this world player one?"
        print '> '
        p1 = $stdin.gets.chomp
        puts "Very well #{p1}, and what of thou player two?"
        print '> '
        p2 = $stdin.gets.chomp
        @player1 = Player.new(p1)
        @player2 = Player.new(p2)
        puts "So be it, prepare to battle #{@player1.name} and #{@player2.name}!"
          start_game
    end

    def start_game # pick random numbers and start game
        @current_player = [@player1.name, @player2.name].sample
        puts "The first challenge goes to #{@current_player}!"
        play
    end
    def play # player has their turn(new question)
        while @lowest_score > 0 do
            questions = Questions.new
            if questions.prompt_input(@current_player)
                puts "CORRECT! Very knowledgable #{@current_player}"
            else
                puts "WRONG! Mayhaps you need more fingers?"
                if @current_player == @player1.name
                    @p1_lives -= 1
                else
                    @p2_lives -=1
                end
            end
            scores
        end
        end_game
    end
    def scores # show scores(lives) the players have and check if any player has 0 lives
        if @p1_lives > @p2_lives
            @lowest_score = @p2_lives
        else
            @lowest_score = @p1_lives
        end
        if @lowest_score == 0
            puts "-------------"
            puts "- Game Over -"
            puts "-------------"
        else
            puts "---------------------------"
            puts "#{@player1.name} has #{@p1_lives} left, #{@player2.name} has #{@p2_lives} left"
            puts "---------------------------"
            if @current_player == @player1.name
                @current_player = @player2.name
            else 
                @current_player = @player1.name
            end
        end
    end
    def end_game # show winner then end
        if @p1_lives == 0
            puts "#{@player2.name} has managed to defeat #{@player1.name}!"
            puts "Shame on you #{@player1.name}"
        else
            puts "#{@player1.name} has managed to defeat #{@player2.name}!"
            puts "Shame on you #{@player2.name}"
        end
    end
end