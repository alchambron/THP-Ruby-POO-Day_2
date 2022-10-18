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

while user.life_points > 0 and (player1.life_points > 0 or player2.life_points > 0)

  puts
  puts user.show_state

  # Menu of choise
  puts "\n------------------------------"
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
  puts '------------------------------'
  puts

  # Asking user the answers
  print 'Tapez votre choix : '
  action_choice = gets.chomp
  puts
  puts '------------------------------'
  puts

  # Conditionning of user choice
  puts '***********************'
  if action_choice == 'a'
    user.search_weapon
  elsif action_choice == 's'
    user.search_health_pack
  elsif action_choice == '0'
    user.attack(player1)
  elsif action_choice == '1'
    user.attack(player2)
  else
    puts 'ERROR : Wrong Answer, retype !'
  end
  break if player1.life_points <= 0 and player2.life_points <= 0
  puts '***********************'

  # Other Player Attacking
  puts
  puts
  puts "Les autres joueurs t'attaquent !"
  puts
  puts '***********************'
  enemies = Player.all_enemies
  enemies.each do |i|
    i.attack(user) if i.life_points > 0
    puts '**********************'
  end

  # Cleaning Space for Next Round
  puts
  print 'Press Enter to continue'
  temp = gets.chomp
  system('clear') if temp == ''
end
