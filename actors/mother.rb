class Actor::Mother < Actor::Base
  include Teamable
  include Moveable
  include Attackable

  def initialize(options = {})
    join_team! options[:team]
    super(options)
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
