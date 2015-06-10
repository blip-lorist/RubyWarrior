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

    # Health check
    # Checks if he needs to back up
    if @health > warrior.health && warrior.health < 10
      warrior.walk!(:backward)
    #Checks if it's safe to heal
    elsif warrior.health < 15 && warrior.feel.empty? && warrior.health == @health
      warrior.rest!
    else
      if @backtracked
        forward_actions(warrior)
      else
        backward_actions(warrior)
      end
    end

    @health = warrior.health

  end

  # What to do when you're moonwalking backwards
  def backward_actions(warrior)
    # Moving backward
    if warrior.feel(:backward).empty?
      warrior.walk!(:backward)
    # Rescues
    elsif warrior.feel(:backward).captive?
      warrior.rescue!(:backward)
    # Fighting
    elsif warrior.feel(:backward).enemy?
      warrior.attack!(:backward)
    end

  end

  # What to do when you're strolling forward
  def forward_actions(warrior)
    # Moving forward
    if warrior.feel.empty?
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
