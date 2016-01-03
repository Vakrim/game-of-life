module Attackable
  attr_accessor :target

  def attack(target)
    @target = target
  end

  def attack_range
    30
  end

  def target_in_range?
    return false if !@target
    Gosu.distance(@target.x, @target.y, x, y) <= attack_range
  end

  def attack_type
    { melee: 2.0 }
  end

  def attack_update(tick)
    if target_in_range?
      target.apply_damage! attack_type
      true
    else
      false
    end
  end
end
