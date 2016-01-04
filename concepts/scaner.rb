class Scaner
  extend Forwardable
  def_delegator :@selected, :[], :first, :last, :any?

  def initialize(actor)
    @actor = actor
    @selected = Actor::Base.all_actors
  end

  def find(&block)
    @selected.find(&block)
  end

  def all
    @selected
  end

  def where(&block)
    @selected.select!(&block)
    self
  end

  def nearest(object = @actor)
    @selected.map! { |a| [a, Gosu.distance(object.x, object.y, a.x, a.y)] }
      .sort! { |x, y| x[1] <=> y[1] }
      .map! { |a| a[0] }
    self
  end

  def friend
    where { |a| a.team == @actor.team }
  end

  def foe
    where { |a| a.team != @actor.team }
  end
end
