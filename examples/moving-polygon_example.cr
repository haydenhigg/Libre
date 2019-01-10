require "../src/*"

Window.init(800, 450, "Moving Polygon")

color = Color.black
x_vel = rand(-5..5)
y_vel = rand(-5..5)
rotate_vel = rand(-3..3)

octagon = RegularPolygon.new
octagon.sides = 8
octagon.radius = 30
octagon.x = 400
octagon.y = 225
octagon.rotation = 0

Window.set_fps(60)
Mouse.set_pos(400, 225)
Graphics.set_color(Color.maroon)

while !Window.should_close?
    octagon.x += x_vel
    octagon.y += y_vel
    octagon.rotation += rotate_vel

    if octagon.x + octagon.radius >= Window.width || octagon.x - octagon.radius <= 0
        x_vel = -x_vel
        rotate_vel = -(rotate_vel + 0.2)
        Graphics.set_color(Color.random)
    end
    if octagon.y + octagon.radius >= Window.height || octagon.y - octagon.radius <= 0
        y_vel = -y_vel
        rotate_vel = -(rotate_vel + 0.2)
        Graphics.set_color(Color.random)
    end

    Graphics.start
    Graphics.clear_background(Color.raywhite)
    Graphics.draw(octagon)
    Graphics.stop
end

Window.close