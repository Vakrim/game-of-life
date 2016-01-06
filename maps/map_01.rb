
Array.new(2){ Team.new }.each do |team|
  10.times do |n|
    Actor::Soldier.new({ x: rand(400), y: rand(400), team: team })
  end
  Actor::Mother.new({ x: rand(400), y: rand(400), team: team })
end
