class Player

  def play_turn(warrior)

    # Resting
    if warrior.health < 14 && warrior.feel.empty? && @health <= warrior.health
      warrior.rest!
    # Moving forward
    elsif warrior.feel.empty?
      warrior.walk!
    # Rescues
    elsif warrior.feel.captive?
      warrior.rescue!
    # Fighting
    else warrior.feel.enemy?
      warrior.attack!
    end
    
  @health = warrior.health
  end

end
