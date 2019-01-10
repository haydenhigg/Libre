require "../src/*"

Window.init(650, 650, "Focal Point")
Window.set_fps(60)

def get_point(x, y, range_inc)
    new_x = rand((x - range_inc).to_f..(x + range_inc).to_f)
    new_y = rand((y - range_inc).to_f..(y + range_inc).to_f)

    if new_x <= 0
        new_x = 0
    elsif new_x >= Window.width
        new_x = Window.width
    end

    if new_y <= 0
        new_y = 0
    elsif new_y >= Window.height
        new_y = Window.height
    end

    new_Point2D(new_x, new_y)
end

while !Window.should_close?
    Graphics.start

    Graphics.clear_background(Color.black)

    30.times do
        919.times do |i|
            p = get_point(Mouse.get_x, Mouse.get_y, i)
            variation = ((p.x - Mouse.get_x).abs.to_i + (p.y - Mouse.get_y).abs.to_i)
            variation = variation * 255/919 > 255 ? 255 : variation * 255/919
            c = Color.create(255 - variation, variation, 255, 255)

            Graphics.square("fill", p, 1, c)
        end
    end

    Graphics.stop

    if Mouse.get_x < 0 || Mouse.get_x > Window.width || Mouse.get_y < 0 || Mouse.get_y > Window.height
        Mouse.cursor_visible(true)
    else
        Mouse.cursor_visible(false)
    end
end

Window.close