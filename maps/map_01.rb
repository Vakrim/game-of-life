
t1 = Team.new
10.times do |n|
  a = Actor::Mother.new({ x: rand(400), y: rand(400), team: t1 })
end

t2 = Team.new
10.times do |n|
  a = Actor::Mother.new({ x: rand(400), y: rand(400), team: t2 })
end
