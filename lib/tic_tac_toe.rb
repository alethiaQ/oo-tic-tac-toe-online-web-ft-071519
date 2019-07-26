class TicTacToe
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],

]


  def initialize
    @board = Array.new(9, " ")
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(player_move)
     player_move.to_i - 1
  end

  def move(spot, token="X")
    @board[spot] = token
  end

  def position_taken?(index_value)
    if @board[index_value].include?("X") || @board[index_value].include?("O")
      return true
    else
      false
    end
  end

  def valid_move?(position)
    !position_taken?(position) && position.between?(0,8)
  end

  def turn
    puts "Please enter a number 1-9"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index) == true
      token = current_player
      move(index, token)
    else
      self.turn
    end
    display_board
  end

  def turn_count
    @board.count { |pos| pos != " "}
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combo|
      if position_taken?(win_combo[0]) && @board[win_combo[0]]== @board[win_combo[1]] && @board[win_combo[1]]== @board[win_combo[2]]
        return win_combo
      end
    end
  end
  def full?
    @board.all? {|spot| spot != " "}
    end

    def draw?
    full? && !won?

    end

    def over?
      won? || full?
    end

    def winner
      if win_combo = won?
        @board[win_combo[0]]
      end
    end

    def play
      while over?
        turn
      end
      if winner?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end


    end


end
