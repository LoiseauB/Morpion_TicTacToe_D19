class BoardGame
  attr_accessor :board
  def initialize
    @board = {'A1'=> ' ', 'A2'=> ' ', 'A3'=> ' ', 'B1'=> ' ', 'B2'=> ' ', 'B3'=> ' ', 'C1'=> ' ', 'C2'=>' ', 'C3'=> ' '}

  end
  
  def update_board(choice, player)
    @board[choice.capitalize] = player.sign 
  end
  
  def display_board #affiche la grille 
    puts
    puts " A   B   C "
    puts
    puts " #{@board['A1']} | #{@board['B1']} | #{@board['C1']}    1" 
    puts '---+---+---'
    puts " #{@board['A2']} | #{@board['B2']} | #{@board['C2']}    2"
    puts '---+---+--- '
    puts " #{@board['A3']} | #{@board['B3']} | #{@board['C3']}    3"
    puts
  end
end


