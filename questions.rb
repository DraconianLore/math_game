class Questions #generate question, prompt players, return true or false
    def generate_question
        @numbers = (1..20).to_a
        @num1 = @numbers.sample
        @num2 = @numbers.sample
        @solution = @num1 + @num2
    end
    def prompt_input(player) # prompt and get input from players
        generate_question
        puts "So... #{player}, what is #{@num1} plus #{@num2}?"
        print "? > "
        @answer = $stdin.gets.chomp.to_i
        return @solution == @answer
    end    
end