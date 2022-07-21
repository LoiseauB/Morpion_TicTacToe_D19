class Game
  attr_accessor :turn_count, :board_game, :current_game, :choice

  def initialize
    @current_game = BoardGame.new
    @board_game = @current_game.board
    @turn_count = 0
    @choice = ''
  end

  def play_a_round(player)
    @current_game.display_board
    puts
    puts "#{player.sign} #{player.name} #{player.sign} à toi de tout défoncer !  😈"
    puts
    puts " Dans quelle case?"
    print "-> "
    choice = gets.chomp
    while choice.capitalize != "A1" && choice.capitalize != "A2" && choice.capitalize != "A3" && choice.capitalize != "B1" && choice.capitalize != "B2" && choice.capitalize != "B3" && choice.capitalize != "C1" && choice.capitalize != "C2" && choice.capitalize != "C3"
        puts "Mais tié con comme la Lune et jamais une eclipse toi ! 😤"
        puts
        puts "Ceci n'est pas une case de morpion..."
        puts " Où souhaites-tu jouer ?"
        print "-> "
        choice = gets.chomp
    end
    while @board_game[choice.capitalize] != ' '
        puts "Mais tié con comme la Lune et jamais une eclipse toi ! 😤"
        puts
        puts "Cette case est déjà prise..."
        puts " Où souhaites-tu jouer ?"
        print "-> "
        choice = gets.chomp
    end

    @current_game.update_board(choice, player)
    
    @turn_count += 1
    system("clear")
  end

    
  def victory_x #definir les cas de victoires pour le player "x"
    

  x = "x".red
  #verticales
    if @board_game['A1'] == x && @board_game['A2'] == x && @board_game['A3'] == x
      return true
    elsif @board_game['B1'] == x && @board_game['B2'] == x && @board_game['B3'] == x 
      return true
    elsif @board_game['C1'] == x && @board_game['C2'] == x && @board_game['C3'] == x 
      return true
       #horizontale
    elsif @board_game['A1'] == x && @board_game['B1'] == x && @board_game['C1'] == x
      return true
    elsif @board_game['A2'] == x && @board_game['B2'] == x && @board_game['C2'] == x
      return true
    elsif @board_game['A3'] == x && @board_game['B3'] == x && @board_game['C3'] == x
      return true
      #diagonales
    elsif @board_game['A1'] == x && @board_game['B2'] == x && @board_game['C3'] == x
      return true
    elsif @board_game['A3'] == x && @board_game['B2'] == x && @board_game['C1'] == x
      return true
    else
      return false
    end
  end

  def victory_o #definir les cas de victoires pour le player "o"
    
    o = "o".blue
    #verticales
    if @board_game['A1'] == o && @board_game['A2'] == o && @board_game['A3'] == o
      return true
    elsif @board_game['B1'] == o && @board_game['B2'] == o && @board_game['B3'] == o
      return true
    elsif @board_game['C1'] == o && @board_game['C2'] == o && @board_game['C3'] == o
      return true
      #horizontales
    elsif @board_game['A1'] == o && @board_game['B1'] == o && @board_game['C1'] == o
      return true
    elsif @board_game['A2'] == o && @board_game['B2'] == o && @board_game['C2'] == o
      return true
    elsif @board_game['A3'] == o && @board_game['B3'] == o && @board_game['C3'] == o
      return true
      #diagonales
    elsif @board_game['A1'] == o && @board_game['B2'] == o && @board_game['C3'] == o
      return true
    elsif @board_game['A3'] == o && @board_game['B2'] == o && @board_game['C1'] == o
      return true
    else 
      return  false
    end
  end


  def draw
    if  victory_x == false && victory_o == false && full? == true
      return true
    end
  end

  def full?
    if @turn_count == 9
      return true
    else
      return false
    end
  end

  def over?
    if victory_o == true || victory_x == true || draw == true
      return true
    else
      return false
    end
  end
end



