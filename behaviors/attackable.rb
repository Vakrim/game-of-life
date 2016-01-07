module Attackable
  attr_accessor :target

  def attack(target)
    @target = target
    @task = :attack
  end

  def attack_range
    20
  end

  def target_in_range?
    return false if !@target
    Gosu.distance(@target.x, @target.y, x, y) <= attack_range
  end

  def attack_type
    { melee: 10 }
  end

  def attack_cooldown
    1.0
  end

  def attack_update(tick)
    if target_in_range? && @timer.since_last?(:attack, attack_cooldown)
      target.apply_damage! attack_type
      true
    else
      false
    end
  end
end
