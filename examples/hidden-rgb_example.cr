require "../src/*"

Window.init(800, 450, "Hidden RGB")

visible = false
color = Color.black

textbox = Rectangle.new
textbox.x = 5
textbox.y = 5
textbox.width = 60
textbox.height = (5 * 17) + 15

Window.set_fps(60)
Mouse.set_pos(400, 225)

while !Window.should_close?
    if Mouse.is_pressed?(MOUSE_LEFT)
        visible = !visible
        Mouse.cursor_visible(!visible)
        color = Color.random
    end

    Graphics.start
    Graphics.clear_background(Color.raywhite)
    if visible
        Graphics.circle("fill", Mouse.get_pos, 30, color)
        Graphics.draw("line", textbox, color)
        Graphics.text("R: #{color.r}\nG: #{color.g}\nB: #{color.b}\nA: #{color.a}", 10, 10, 17, Color.darkgray)
    end
    Graphics.stop
end

Window.close