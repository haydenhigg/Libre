require "../src/*"

Window.init(650, 650, "Probability")
Window.set_fps(0)

pixels = [] of Point2D
colors = [] of ColorObject
colors2 = [] of ColorObject

40.times do
    650.times do |i|
        x = rand(i) % Window.width
        y = rand(i) % Window.height
        pixels << new_Point2D(x, y)
    end
end

pixels.each do |cur_p|
    a = 0
    a2 = 255

    pixels.each do |p|
        if (cur_p.x - p.x).abs * (cur_p.y - p.y).abs <= 25
            a += a == 255 ? -1 : 1
            a2 -= a2 == 0 ? -1 : 1
        end
    end

    colors << Color.create(255, 0, 255, a)
    colors2 << Color.create(0, 255, 255, a2)
end

while !Window.should_close?
    Graphics.start

    Graphics.clear_background(Color.black)

    pixels.each_with_index do |p, i|
        Graphics.square("fill", p, 1, colors[i])
        Graphics.square("fill", p, 1, colors2[i])
    end

    625.times do |i|
        Graphics.point(i, i, Color.white)
    end

    Graphics.stop
end

Window.close