require "../src/*"

Window.init(650, 650, "Probability")
Window.set_fps(1)

while !Window.should_close?
    Graphics.start

    Graphics.clear_background(Color.black)

    162.times do
        650.times do |i|
            x = rand(i) % Window.width
            y = rand(i) % Window.height
            col = Color.darkpurple

            # z = (x + y)/(Window.width/255) > 255 ? 255 : (x + y)/(Window.height/255)

            # col = Color.create(255 - z, z, 255, 255)

            if x * 2 + y * 2 < Window.width/4 + Window.height/4
                col = Color.red
            elsif x * 2 + y * 2 < Window.width/2 + Window.height/2
                col = Color.yellow
            elsif x * 2 + y * 2 < Window.width * 0.75 + Window.height * 0.75
                col = Color.green
            elsif x * 2 + y * 2 < Window.width + Window.height
                col = Color.lime
            elsif x * 2 + y * 2 < Window.width * 1.25 + Window.height * 1.25
                col = Color.blue
            elsif x * 2 + y * 2 < Window.width * 1.5 + Window.height * 1.5
                col = Color.purple
            elsif x * 2 + y * 2 < Window.width * 1.75 + Window.height * 1.75
                col = Color.violet
            end

            Graphics.square("fill", x, y, 1, col)
        end
    end

    650.times do |i|
        Graphics.square("fill", i, i, 2, Color.white)
    end

    Graphics.stop
end

Window.close