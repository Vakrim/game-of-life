module Teamable
  attr_reader :team

  def initialize(options = {})
    join_team! options.delete(:team)
    super(options)
  end

  def join_team!(team = nil)
    @team = team || Team.new
    @team.join(self)
    @team
  end
end
