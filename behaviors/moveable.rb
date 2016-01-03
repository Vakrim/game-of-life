module Moveable
  attr_accessor :target

  def move_to(target)
    @target = target
  end

  def speed
    20.0
  end

  def is_at_target?
    @is_at_target
  end

  def move_update(tick)
    return unless @target
    distance_to_target = Gosu.distance(@target.x, @target.y, x, y)
    if distance_to_target <= tick * speed
      @is_at_target = true
    else
      @x += (@target.x - x) / distance_to_target * tick * speed
      @y += (@target.y - y) / distance_to_target * tick * speed
      @is_at_target = false
    end
  end
end
