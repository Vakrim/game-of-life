class Actor::Mother < Actor::Base
  include Teamable
  include Moveable
  include Attackable

  def initialize(options = {})
    join_team! options[:team]

    define_logic do |ac|

    end

    super(options)
  end
end
