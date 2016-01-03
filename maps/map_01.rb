a = Actor::Mother.new({ x: 30, y: 30 })

b = Actor::Mother.new({ x: 130, y: 130 })

a.attack(b)
b.attack(a)
