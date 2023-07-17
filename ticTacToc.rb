#Class for board
class Board
    def initialize
        @board = Array.new(9) { |n| n+1}
    end

    def display_board
        puts "\n
        #{@board[0]}|#{@board[1]}|#{@board[2]}
        —+—+—
        #{@board[3]}|#{@board[4]}|#{@board[5]}
        —+—+—
        #{@board[6]}|#{@board[7]}|#{@board[8]}"
    end

    def update_board(location, symbol)
        if legal_move?(location)
            @board[location-1] = symbol
            display_board
        else
            puts "That square is already taken! Try again."
            location = gets.chomp
            @board.update_board(location)
        end
    end

    def legal_move?(location)
        return true if @board[location-1].is_a?(Numeric)
    end
end

#Class for game
class Game
    attr_accessor :player_one, :player_two, :board, :newBoard

    def initialize
        @newBoard = Board.new
    end

    #Check for playable square
    def playable?
        return true if board.any? {|element| element.is_a?(Numeric)}
    end

    #Check for winner
    winner = Array.new(9){Array.new(8)}
    winner = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]
    def winner?(symbol)
        length = @board.length
        x = 0
        while x < length
            board.values_at(winner[x]).all? {|sym| sym == symbol}
            x += 1
        end 
    end

    def setup 
        @@number_of_players = 0
        while @@number_of_players < 1 do
            #Puts welcome information
            puts "Welcome! Let's play a game of Tic Tac Toe!"

            #Assign names and markers to players
            puts "Player one, what's your name?"
            @player_one = Player.new(gets.chomp, "X")

            #@player_one.name = gets.chomp
            @@number_of_players += 1
            puts "Hello, #{player_one.name}, you will play as X."

            puts "Player two, what's your name?"
            @player_two = Player.new(gets.chomp, "O")
            @@number_of_players += 1
            puts "Hello, #{player_two.name}, you will play as O."            
        end
    end

    #Display the basic, empty board and prompt player to choose
    def start_game
        setup
        loop do
            make_move
            if check_win_conditions
                puts "Congratulations! You win!"
                break
            end
            if !playable?
                puts "It's a tie! Try again next time."
                break
            end
            #prompt for next game and reset?
        end
    end

    def make_move
        turn = true
        #Alter board
        #Switch player and repeat prompt and alter board scenario
        if (turn)
            puts "#{@player_one.name}, please choose where to play."
            move = gets.chomp
            while !move.match?(/^\d+$/)
                puts "#{@player_one.name}, please choose a valid place to play."
                move = gets.chomp
            end
            @newBoard.update_board(move.to_i, @player_one.symbol)
            turn = false
        else
            puts "#{@player_two.name}, please choose where to play."
            move = gets.chomp
            @newBoard.update_board(move, @player_two.symbol)
            turn = true
        end
    end

    def check_win_conditions
        if @newBoard.winner?(@player_one.symbol)
            puts "Congratulations #{@player_one}!"
        elsif @newBoard.winner?(@player_two.symbol)
            puts "Congratulations #{@player_one}!"
        end
    end

end

#Class for players
class Player 
    attr_accessor :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end
end

newBoard = Board.new()
newBoard.display_board()
newGame = Game.new()
newGame.start_game