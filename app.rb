require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/board'
require 'app/game'
require 'app/player'

String.disable_colorization = false # enable colorization


puts "          Bienvenue dans le meilleur jeu de Morpion de l'histoire de THP          ".colorize(:color => :white, :background => :green)
puts
puts "Comment t'appelles tu?".colorize(:red).on_blue.underline
print "> "
player1_name = gets.chomp 
player1 = Player.new(player1_name)
player1.sign = "x".red
puts "Bienvenue #{player1_name}! Ton signe est #{player1.sign}"
puts " "
puts "Comment s'appelle ton adversaire?"
print "> "
player2_name = gets.chomp 
player2 = Player.new(player2_name)
player2.sign = "o".blue
puts "Bienvenue #{player2_name}! Ton signe est #{player2.sign}"
puts "Les choses sérieuses commencent! Bonne chance à tous les deux!!"

continue = true

while continue == true
  game = Game.new
  while game.over? == false
    game.play_a_round(player1)
    
    #binding.pry
    game.full?
    game.victory_x
    game.draw
    game.over?
      break if game.over? == true
    game.play_a_round(player2)
    game.full?
    game.victory_o
    game.draw
    game.over?
  end
  puts "Chaud pour une nouvelle partie ? y/n"
  print "-> "
  continue_str = gets.chomp
  if continue_str == "y"
    continue = true
  else
    continue = false
  end
end


