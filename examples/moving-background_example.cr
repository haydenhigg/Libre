require "../src/*"

Window.init(800, 450, "Stars")
stars = Array(Array(Int32)).new

Window.set_fps(60)
Graphics.set_color(Color.black)

100.times do
    stars << [rand(Window.width), rand(Window.height)]
end

while !Window.should_close?
    stars.each do |star|
        star[1] += 1

        if star[1] >= Window.height
            star[1] = 0
        end
    end

    Graphics.start
    stars.each do |star|
        Graphics.clear_background()
        Graphics.point(star[0], star[1], Color.white)
    end
    Graphics.stop
end

Window.close