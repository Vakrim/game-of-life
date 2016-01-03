module Teamable
  attr_reader :team

  def join_team!(team = nil)
    @team = team || Team.new
    @team.join(self)
    @team
  end
end
