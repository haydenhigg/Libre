require "../src/*"

screen_width = 800
screen_height = 450

Window.init(screen_width, screen_height, "raylib [core] example - Color selection by mouse (collision detection)")

colors = [Color.darkgray, Color.maroon, Color.orange, Color.darkgreen, Color.darkblue, Color.darkpurple, Color.darkbrown,
          Color.gray, Color.red, Color.gold, Color.lime, Color.blue, Color.violet, Color.brown, Color.lightgray, Color.pink, Color.yellow,
          Color.green, Color.skyblue, Color.purple, Color.beige]

rects = Array(Square).new
selected = Array(Bool).new(21, false)
hovered = Array(Bool).new(21, false)

21.times do |i|
    rec = Square.new

    rec.x = 20 + 100*(i%7) + 10*(i%7)
    rec.y = 60 + 100*(i/7) + 10*(i/7)
    rec.size = 100

    rects << rec
end

mouse_point : Point2D

Window.set_fps(60)

while !Window.should_close?
    Graphics.start

    Graphics.clear_background(Color.raywhite)

    21.times do |i|
        Graphics.draw(rects[i], colors[i])

        if hovered[i]
            Graphics.square(rects[i].x, rects[i].y, rects[i].size, Color.create(255, 255, 255, 135))
        end

        if selected[i]
            Graphics.rectangle(rects[i].x, rects[i].y, 100, 10, Color.raywhite)
            Graphics.rectangle(rects[i].x, rects[i].y, 10, 100, Color.raywhite)
            Graphics.rectangle(rects[i].x + 90, rects[i].y, 10, 100, Color.raywhite)
            Graphics.rectangle(rects[i].x, rects[i].y + 90, 100, 10, Color.raywhite)
        end
    end

    Graphics.stop

    mouse_point = Mouse.get_pos

    21.times do |i|
        if Mouse.is_on?(rects[i])
                hovered[i] = true
            
            if Mouse.is_down?(MOUSE_LEFT)
                selected[i] = !selected[i]
            end
        else
            hovered[i] = false
        end
    end
end

Window.close