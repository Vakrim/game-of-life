class Timer
  @@game_time = 0

  def initialize
    @events = {}
  end

  def self.step(dt)
    @@game_time += dt
  end

  def since_last?(action, time)
    if @events[action].nil? || @events[action] <= @@game_time - time
      @events[action] = @@game_time
      true
    else
      false
    end
  end
end
