require "../src/*"

Window.init(1250, 675, "Natural")
Window.set_fps(120)

Graphics.start
Graphics.clear_background(Color.black)
Graphics.stop

x = Window.width/2
y = Window.height/2

block_size = 3
regionalize = true
r_limit = 5
r_counter = 0

while !Window.should_close?
    Graphics.start

    unless regionalize
        Graphics.square("fill", x, y, block_size, Color.random)
    else
        Graphics.square("fill", x, y, block_size, Color.random)
    end

    x += [-block_size, 0, block_size].sample
    y += [-block_size, 0, block_size].sample

    Graphics.stop

    r_counter += 1
end

Window.close