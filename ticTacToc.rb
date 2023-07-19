#Class for board
class Board

    attr_accessor :board

    def initialize
        @board = Array.new(9) { |n| n+1}
    end

    #Print the board
    def display_board
        puts "\n
        #{@board[0]}|#{@board[1]}|#{@board[2]}
        —+—+—
        #{@board[3]}|#{@board[4]}|#{@board[5]}
        —+—+—
        #{@board[6]}|#{@board[7]}|#{@board[8]}"
    end

    #Make a move
    def update_board(location, symbol)
        @board[location-1] = symbol
        display_board
    end

    #Check for winner
    def winner?(symbol, currentBoard)

        winner = Array.new(9){Array.new(8)}
        winner = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]

        #Outside loop goes through the first array of winner
        winner.each do |combination|
            #internal loop goes through nested hash, making arr with the corresponding position on the board
            arr = combination.map do |position|
                @board[position]
            end
            #Check if arr is all one symbol.
            if arr.all? {|sym| sym == symbol}
                puts "Working"
                return true
            end
            puts "No match"
        end
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
        return true if @newBoard.any? {|element| element.is_a?(Numeric)}
    end

    def setup 
        @@number_of_players = 0
        while @@number_of_players < 1 do
            #Puts welcome information
            puts "Welcome! Let's play a game of Tic Tac Toe!"

            #Assign names and markers to players
            puts "Player one, what's your name?"
            @player_one = Player.new(gets.chomp, "X")
            puts "\n"

            @@number_of_players += 1
            puts "Hello, #{player_one.name}, you will play as X."
            puts "\n"

            puts "Player two, what's your name?"
            @player_two = Player.new(gets.chomp, "O")
            @@number_of_players += 1
            puts "Hello, #{player_two.name}, you will play as O."
            puts "\n"
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
            while (!move.match?(/^\d+$/) || move.to_i > 9)
                puts "#{@player_one.name}, please choose a valid place to play."
                move = gets.chomp
                puts "\n"
            end
            @newBoard.update_board(move.to_i, @player_one.symbol)
            turn = false
        else
            puts "#{@player_two.name}, please choose where to play."
            move = gets.chomp
            puts "\n"
            @newBoard.update_board(move, @player_two.symbol)
            turn = true
        end
    end

    def check_win_conditions
        if @newBoard.winner?(@player_one.symbol, @newBoard)
            puts "Congratulations #{@player_one.name}!"
        elsif @newBoard.winner?(@player_two.symbol, @newBoard)
            puts "Congratulations #{@player_one.name}!"
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