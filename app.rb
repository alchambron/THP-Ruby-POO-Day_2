# Call the ruby lib
require_relative 'lib/player'
require_relative 'lib/game'

# Create players
player1 = Player.new('Josiane')
player2 = Player.new('José')

# Condition if a player is dead
while player1.life_points > 0 and player2.life_points > 0

  # Screen of each action depending of the methods results
  puts '--------------------------------'
  puts "Voici l'états de chaque joueurs :"
  puts '--------------------------------'
  puts
  puts "\n#{player1.show_state}"
  puts "\n#{player2.show_state}"
  puts
  puts '--------------------------------'
  puts "Passons à la phase d'attaque :"
  puts '--------------------------------'
  puts
  player1.attack(player2)
  puts

  # Confition to avoid the bug of a dead killer
  break if player2.life_points <= 0

  player2.attack(player1)
  puts

end
