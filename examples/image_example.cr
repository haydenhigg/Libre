require "../src/*"

Window.init(800, 450, "Image")
Window.set_fps(60)
texture = Texture.load(ARGV[0])

while !Window.should_close?
    Graphics.start
    Graphics.clear_background(Color.raywhite)

    Graphics.draw(texture, Mouse.get_x.to_i - 30, Mouse.get_y.to_i - 20, -(Window.height/2 - Mouse.get_y), 0.1, Color.white)
    Mouse.cursor_visible(false)

    Graphics.stop
end
Window.close