#Class for board
class Board
    def initialize
        @board = Array.new(9) { |n| n+1}
        puts @board.length
    end

    def display_board
        puts "\n
        #{@board[0]}|#{@board[1]}|#{@board[2]}
        —+—+—
        #{@board[3]}|#{@board[4]}|#{@board[5]}
        —+—+—
        #{@board[6]}|#{@board[7]}|#{@board[8]}"
    end

    def update_board(number)
        @board[number-1] = player_symbol
        display_board
    end

end

#Class for game
class Game
    #Puts welcome information
    puts "Welcome! Let's play a game of Tic Tac Toe!"

    #Assign names and markers to players
    puts "Player one, what's your name?"
    player_one = Player.new{gets.chomp, "X"}
    puts "Hello, #{player_one}, you will play as X."
    puts "Player two, what's your name?"
    player_two = Player.new {gets.chomp, "O"}
    puts "Hello, #{player_two}, you will play as O."

    turn = 1
    #Display the basic, empty board and prompt player to choose

    newBoard = Board.new()
    newBoard.display_board()
    if (turn == 1)
        puts "#{player_one}, please choose where to play."
        move = gets.chomp
        @board[move] = player_one[symbol]
        turn = 2
    else
        puts "#{player_two}, please choose where to play."
        move = gets.chomp
        @board[move] = player_two[symbol]
        turn = 1
    end


    

    #Alter board

        #Check if winner and not full

        #If winner, congratulate

        #If no playable square, declare draw

    #Switch player and repeat prompt and alter board scenario
    winner = Array.new(9){Array.new(8)}
    winner = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]
    def winner?(symbol)
        length = length
        x = 0
        while x < length
            board.values_at(winner[x]).all? {|sym| sym = symbol}
        end 
    end
end

#Class for players
class Player 
    @@number_of_players = 0

    def initialize(name, symbol)
        #puts "Player #{@@number_of_players +1}, what's your name?"
        @name = name
        @@number_of_players +=1
        @symbol = symbol
    end
end

newBoard = Board.new()
newBoard.display_board()
