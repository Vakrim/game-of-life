class Actor::Base
  @@actors = []

  attr_reader :x, :y, :hp

  def self.all_actors
    @@actors.dup
  end

  def initialize(options = {})
    @@actors.push(self).shuffle!
    @is_alive = true
    @x = options[:x] || 0
    @y = options[:y] || 0
    @hp = options[:hp] || max_hp
    @hp_text = Gosu::Font.new(12)
    @timer = Timer.new
  end

  def max_hp
    30
  end

  def restore_hp!
    self.hp = max_hp
  end

  def apply_damage!(damage)
    @hp -= damage.values.reduce(:+)
    destroy! if @hp <= 0
  end

  def update(tick)
    logic if @timer.since_last?(:logic, 1.0)
    @target = nil if @target && !@target.exists?
    if respond_to?(:attack_update) && :attack == @task && attack_update(tick)
    elsif respond_to?(:move_update) && move_update(tick)
    end
  end

  def logic; end

  def draw
    color = Gosu::Color::WHITE
    color = team.color if respond_to? :team
    Gosu::draw_rect(x - 5, y - 5, 10, 10, color)
    @hp_text.draw_rel(sprintf("%i / %i", hp, max_hp), x, y + 10, 1, 0.5, 0) if hp < max_hp
  end

  def alive?
    @is_alive
  end

  def exists?
    alive?
  end

  def destroy!
    @is_alive = false
    @@actors.delete self
  end
end
