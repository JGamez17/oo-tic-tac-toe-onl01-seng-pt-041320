class TicTacToe
  
  def initialize 
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1 ,2],
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 4, 8], #diagonal 1
    [2, 4, 6], #diagonal 2
    [0, 3, 6], #column left
    [1, 4, 7], #column middle
    [2, 5, 8]
    
    ]
    
   def display_board  
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index (input) 
        index = input.to_i - 1
    end
    
    def move (index, token="X") 
        @board[index] = token
    end
    
    def position_taken?(index)  
         @board[index] == " " ? false : true 
    end
    
    def valid_move? (position)  
        position.between?(0,8) && @board[position] == " " ? true : false
    end
    
    def turn_count 
        @board.count { |x| x != " " } #count all the fields that are not empty
    end
    
    def current_player  
        player = turn_count
        player %2 == 0 ? player = "X" : player = "O"
    end
    
    def turn  #makes a turn by getting a user input and making a turn and displaying a board or running this method again if the turn is not valid
        puts "Please choose a number 1-9: "
        user_input = gets.chomp
        index = input_to_index(user_input)
        if valid_move?(index)
          player_token = current_player
          move(index, player_token)
          display_board
        else
          turn
        end
    end
    
    def won?
      WIN_COMBINATIONS.each do |combo|
            index_0 = combo[0]
            index_1 = combo[1]
            index_2 = combo[2]

            position_1 = @board[index_0]
            position_2 = @board[index_1]
            position_3 = @board[index_2]

            if position_1 == "X" && position_2 == "X" && position_3 == "X"
                return combo
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
                return combo
            end
        end
        return false
    end
    
    def full?
      !@board.include? " "
    end
      
   def draw?
       full? && !won? ? true : false
   end
   
   def over?
        won? || draw? ? true : false
   end
   
   def winner
        WIN_COMBINATIONS.each do |combo|
            index_0 = combo[0]
            index_1 = combo[1]
            index_2 = combo[2]

            position_1 = @board[index_0]
            position_2 = @board[index_1]
            position_3 = @board[index_2]

            if position_1 == "X" && position_2 == "X" && position_3 == "X"
                return "X"
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
                return "O"
            end
        end
        return nil
    end

    def play
        until over? == true
          turn
        end
      
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end 
end 