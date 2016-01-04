class Waypoint
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def exists?
    true
  end
end
