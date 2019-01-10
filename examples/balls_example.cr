require "../src/*"

Window.init(1250, 675, "Balls")
Window.set_fps(120)

class Cell
    @x : Int32
    @y : Int32
    @x_vel : Float64
    @y_vel : Float64
    @color : ColorObject
    @size : Float64

    property x
    property y
    property x_vel
    property y_vel
    property color
    property size

    def initialize(x, y, x_vel, y_vel, color, size)
        @x = x.to_i
        @y = y.to_i
        @x_vel = x_vel.to_f64
        @y_vel = y_vel.to_f64
        @color = color
        @size = size.to_f64
    end

    def move
        Cell.new(@x + @x_vel.to_i, @y + @y_vel.to_i, @x_vel, @y_vel, @color, @size)
    end

    def contain(x_border, y_border)
        ret = self

        if ret.x + ret.size >= x_border || ret.x - ret.size <= 0
            ret.x_vel = -ret.x_vel
        end
        if ret.y + ret.size >= y_border || ret.y - ret.size <= 0
            ret.y_vel = -ret.y_vel
        end

        ret
    end
end

cells = [] of Cell
cell_num = 2000;

cell_num.times do
    cell_size = Random.rand(1..3)
    cells << Cell.new(Random.rand(Window.width - cell_size), Random.rand(Window.height - cell_size), Random.rand(1.0..2.5), Random.rand(0.5..3.0), Color.random, cell_size)
end

while !Window.should_close?
    Graphics.start

    Graphics.clear_background(Color.black)

    cells.each_index do |c|
        Graphics.circle("fill", cells[c].x, cells[c].y, cells[c].size, cells[c].color)
        cells[c] = cells[c].move
        cells[c] = cells[c].contain(Window.width, Window.height)
    end

    Graphics.stop
end

Window.close