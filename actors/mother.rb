class Actor::Mother < Actor::Base
  include Teamable
  include Moveable
  include Attackable

  def movement_speed
    20.0
  end

  def max_hp
    100.0
  end

  def size
    15.0
  end

  def logic
    nearest_enemy = Scaner.new(self).foe.nearest.first
    if nearest_enemy
      attack nearest_enemy
    else
      move_to Waypoint.new(rand(500), rand(500))
    end
  end
end
