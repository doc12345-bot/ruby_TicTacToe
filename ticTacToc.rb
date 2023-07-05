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

    def update_board(number)
        @board[number-1] = player_symbol
        display_board
    end

end

#Class for game

#Class for players
class Player 
    @@number_of_players = 0

    def initialize(name)
        #puts "Player #{@@number_of_players +1}, what's your name?"
        @name = gets.chomp 
        @@number_of_players +=1
    end
end

newBoard = Board.new()
newBoard.display_board()
