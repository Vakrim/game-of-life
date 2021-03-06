class GameWindow < Gosu::Window

  def initialize
   super(640, 480, false)
   self.caption = 'Hello World!'

   require './maps/map_01.rb'

   @fps_text = Gosu::Font.new(24)
   @game_time = 0
  end

  def update
    tick = 1.0/60
    Timer.step(tick)
    Actor::Base.all_actors.each { |a| a.update tick }
    Actor::Base.fix_overlaping!
  end

  def draw
    Actor::Base.all_actors.each(&:draw)
    @fps_text.draw_rel("#{Gosu.fps}", 640, 0, 1, 1, 0)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

  def needs_cursor?
    true
  end
end

window = GameWindow.new
window.show
