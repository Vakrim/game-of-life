require 'forwardable'

class ActorLogic
  extend Forwardable

  def initialize(actor)
    @actor = actor
  end

  def_delegators :@actor, :move_to
  def_delegators :@actor, :attack
end
