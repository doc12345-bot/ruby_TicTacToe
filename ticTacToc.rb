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

    #Assign names and markers to players

    #Display the basic, empty board and prompt player to choose

    #Alter board

        #Check if winner and not full

        #If winner, congratulate

        #If no playable square, declare draw

    #Switch player and repeat prompt and alter board scenario
    winner = Array.new(9){Array.new(8)}
    winner = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]
    def win_conditions

    end
end

#Class for players
class Player 
    @@number_of_players = 0

    def initialize(name)
        #puts "Player #{@@number_of_players +1}, what's your name?"
        @name = name
        @@number_of_players +=1
    end
end

newBoard = Board.new()
newBoard.display_board()
