# ------------- Player ---------------------
class Player
  attr_accessor :name, :life_points

  # Initialisation of the infos of each players
  def initialize(name)
    @name = name
    @life_points = 10
  end

  # Initialisation of the status of health of each players
  def show_state
    print "#{@name} à #{@life_points} points de vie." if @life_points > 0
  end

  # Script who implement and store the damage of each players
  def gets_damage(damage)
    @life_points -= damage
    puts "\nle joueur #{@name} a été tué !" if @life_points <= 0
  end

  # Script to attack another player and take some of his health
  def attack(player)
    damages = compute_damage
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    puts "Il lui inflige #{damages} points de dommages"
    player.gets_damage(damages)
  end

  # Script to randomize a number between 1 and 6
  def compute_damage
    rand(1..6)
  end
end

# ------------- Human Player ------------------
class HumanPlayer < Player
  attr_accessor :weapon_level

  # Initialisation of the new info of player
  def initialize(name)
    @life_points = 100
    @weapon_level = 1
  end

  # Initialisation of the status of health and weapon of the human player
  def show_state
    puts "#{@name} à #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  # Script to randomize a number between 1 and 6 and multiply him
  def compute_damage
    rand(1..6) * @weapon_level
  end

  # Def to compare actual weapon with a randomize number, and modify the weapon_level
  def search_weapon
    dice = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice}."

    if dice > @weapon_level
      @weapon_level = dice
      puts 'Youhou ! elle est meilleure que ton arme actuelle : tu la prends.'
    else
      puts "M@*#... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  # Script to 
  def search_health_pack
    dice = rand(1..6)

    if dice == 1
      puts "Tu n'as rien trouvé"

    elsif dice >= 2 and dice <= 5
      @life_points += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"

    elsif dice == 6
      max = 100 - @life_points
      if max > 20
        @life_points += 80 - (80 - max)
      else
        @life_points += 80
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end



end
