class Player


  def play_turn(warrior)

    if warrior.health < 12 && warrior.feel.empty? && @health <= warrior.health
      warrior.rest!
    #First, I need to check what's in front of me.
    elsif warrior.feel.empty?
      warrior.walk!
    elsif warrior.feel.enemy?
      warrior.attack!
    end
  @health = warrior.health
  end
end
