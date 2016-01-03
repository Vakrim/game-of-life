class Team
  attr_accessor :color
  @@teams = []

  def initialize
    @@teams << self
    @color = Gosu::Color.new(255, rand(256), rand(256), rand(256))
    @members = []
  end

  def join(member)
    @members << member unless @members.include? member
  end

  def other_teams
    @@teams - [self]
  end
end
