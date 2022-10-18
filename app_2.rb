# Call the ruby lib
require_relative 'lib/player'
require_relative 'lib/game'

# Welcome

puts '--------------------------------------'
puts '| Bienvenue sur ILS VEULENT MA POO   |'
puts '|   Le but du jeu est de survivre    |'
puts '--------------------------------------'

# Player Creation

print 'Quel est votre prénom ? '
name = gets.chomp
user = HumanPlayer.new(name)

# PNJ Creation

player1 = Player.new('Josiane')
player2 = Player.new('José')
system('clear')

#------ Attacking Part -------

# while user.life_points > 0 and (player1.life_points > 0 or player2.life_points > 0)

  # Menu of choise
  puts "------------------------------"
  puts 'Quel action veut tu effectuer ?'
  puts
  puts ' a - chercher une meilleure arme'
  puts ' s - chercher à se soigner'
  puts
  puts 'attaquer un joueur en vue :'
  print ' 0 - '
  puts "#{player1.show_state}"
  print ' 1 - '
  puts "#{player2.show_state}"
  puts "------------------------------"


# end
