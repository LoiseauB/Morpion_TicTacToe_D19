require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/board'
require 'app/game'
require 'app/player'

String.disable_colorization = false # enable colorization

system("clear")
puts "                                                                                  ".colorize(:color => :black, :background => :yellow)
puts "          Bienvenue dans le meilleur jeu de Morpion de l'histoire de THP  👾      ".bold.colorize(:color => :black, :background => :yellow)
puts "                Ramène ton meilleur adversaire pour jouer à deux !                ".bold.colorize(:color => :black, :background => :yellow)
puts "              by @Bretchaa, @linahello & @LoiseauB from le Vocal_15               ".bold.colorize(:color => :black, :background => :yellow)
puts "                                                                                  ".colorize(:color => :black, :background => :yellow)
puts 
puts "Prèt à mettre la honte à ton pote ? Lances une partie 😈".yellow
sleep 1
puts
puts "Comment t'appelles tu?".colorize(:black).on_yellow.underline
puts
print " 🖍 > "
player1_name = gets.chomp 
player1 = Player.new(player1_name)
player1.sign = "x".red
puts
print "Bienvenue " 
print "#{player1_name}".colorize(:color => :white, :background => :red)
puts "! Ton signe est #{player1.sign}"
puts " "
puts "Comment s'appelle ton adversaire?"
puts
print " 🖌 > "
player2_name = gets.chomp 
player2 = Player.new(player2_name)
player2.sign = "o".blue
puts
print "Bienvenue " 
print "#{player2_name}".colorize(:color => :white, :background => :blue)
puts "! Ton signe est #{player2.sign}"
puts
sleep 2
system("clear")
puts "Les choses sérieuses commencent! Bonne chance à tous les deux!!".yellow

continue = true

while continue == true
  game = Game.new
  while game.over? == false
    game.play_a_round(player1)
    
    #binding.pry
    game.full?
    game.victory_x
      if game.victory_x == true
        puts
        puts "BRAVO!! Tu as gagné #{player1_name}!  ❌🏆".
        sleep 1
        system("clear")
        puts "#{player2_name}... LOOOOOOOOOOOOOOOOOOSER !!!! 🤣".colorize(:white).on_red.underline
        sleep 2
        system("clear")
      end
    game.draw
      if game.draw == true 
        puts "Vous êtes aussi stupide l'un que l'autre... 😫".colorize(:black).on_green.underline
        puts "MATCH NUL!! Recommencez un partie pour vous départager!".colorize(:black).on_green.underline
        sleep 2
        system("clear")
      end
    game.over?
      break if game.over? == true
    game.play_a_round(player2)
    game.full?
    game.victory_o
      if game.victory_o == true
        puts
        puts "BRAVO!! Tu as gagné #{player2_name}!  🔵🏆".blue
        sleep 1
        system("clear")
        puts "#{player1_name}... LOOOOOOOOOOOOOOOOOOSER !!!! 🤣".colorize(:white).on_red.underline
        sleep 2
        system("clear")
     end
    game.draw
      if game.draw == true 
        puts "Vous êtes aussi stupide l'un que l'autre... 😫".colorize(:black).on_green.underline
        puts "MATCH NUL!! Recommencez une partie pour vous départager!".colorize(:black).on_green.underline
        sleep 2
        system("clear")
      end
    game.over?
  end
  puts
  puts "Chaud pour une nouvelle partie ? y/n".colorize(:black).on_yellow.underline
  print "-> "
  continue_str = gets.chomp
  if continue_str == "y"
    continue = true
  else
    continue = false
  end
end


