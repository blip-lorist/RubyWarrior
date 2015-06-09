class Player
  def play_turn(warrior)

   #If you reach 50% health, force heal if there are no monsters
    if warrior.health < 10 && warrior.feel.empty?
      warrior.rest!
    #First, I need to check what's in front of me.
    elsif warrior.feel.empty?
      warrior.walk!
    elsif warrior.feel.enemy?
      warrior.attack!
    end

  end
end
