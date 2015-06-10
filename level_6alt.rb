class Player

  def initialize
    @backtracked = false

  end

  def play_turn(warrior)
    @warrior = warrior

    check_backtrack

    if healthy?
      progress
    else
      gain_health
    end

    @health = @warrior.health

  end


  def check_backtrack
    if @warrior.feel(:backward).wall?
      @backtracked = true
    end
  end

  def healthy?
    if @warrior.health > 10
      true
    else
      false
    end
  end

  def gain_health
    if @health > @warrior.health
      @warrior.walk!(:backward)
    elsif @health == @warrior.health  && @warrior.health < 15
      @warrior.rest!
    end
  end

  def progress
    if @backtracked
      forward_actions
    else
      backward_actions
    end
  end

  def forward_actions
    if @warrior.feel.empty?
     @warrior.walk!
      # Rescues
    elsif @warrior.feel.captive?
    @warrior.rescue!
     # Fighting
    else @warrior.feel.enemy?
    @warrior.attack!
    end
  end

  def backward_actions
    if @warrior.feel(:backward).empty?
      @warrior.walk!(:backward)
    # Rescues
    elsif @warrior.feel(:backward).captive?
      @warrior.rescue!(:backward)
    # Fighting
    else @warrior.feel(:backward).enemy?
      @warrior.attack!(:backward)
    end
  end

end
