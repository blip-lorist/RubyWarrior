class Player
  def play_turn(warrior)

    # If the way is clear, move forward
    if warrior.feel.empty?
      warrior.walk!
    # If you meet the patriarchy, then smash it! (Thanks Brenna for the inspiration!)
    elsif warrior.feel.enemy?
      warrior.attack!
    end
  end
end
