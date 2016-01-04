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
    attack nearest_enemy if nearest_enemy
  end
end
