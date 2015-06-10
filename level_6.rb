class Player

  def initialize
    @backtracked = false
    @health = 20
  end
  
  def play_turn(warrior)

    # Have you backtracked yet?
    if warrior.feel(:backward).wall?
      @backtracked = true
    end

    # Movement
    if @backtracked
      forward_actions(warrior)
    else
      backward_actions(warrior)
    end

    @health = warrior.health

  end

  # What to do when you're moonwalking backwards
  def backward_actions(warrior)
   if warrior.health < 14 && warrior.feel(:backward).empty? && @health <= warrior.health
      warrior.rest!
    # Moving forward
    elsif warrior.feel(:backward).empty?
      warrior.walk!(:backward)
    # Rescues
    elsif warrior.feel(:backward).captive?
      warrior.rescue!(:backward)
    # Fighting
    else warrior.feel(:backward).enemy?
      warrior.attack!(:backward)
    end

  end

  # What to do when you're strolling forward
  def forward_actions(warrior)
    # Resting
    if warrior.health < 14 && warrior.feel.empty? && @health < warrior.health
      warrior.walk!(:backward)
    elsif warrior.health < 14 && warrior.feel.empty? && @health >= warrior.health
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

  end


end
