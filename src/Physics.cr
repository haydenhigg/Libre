require "./Bindings"
require "./Structures"
require "./Keys"

class PhysObject
    @mass : Float64
    @x_velocity : Float64
    @y_velocity : Float64
    @gravity : Float64
    @meter : Int32

    @callback : Proc(PhysObject, PhysObject, Void)
    @bounce : Float64

    property :mass

    property :callback
    property :bounce

    getter :x_velocity
    getter :y_velocity
    getter :gravity
    getter :meter

    def initialize(mass, x_vel = 0, y_vel = 0, gravity = 9.81, meter = 1000, bounce = 0)
        @mass = mass.to_f64
        @x_velocity = x_vel.to_f64 
        @y_velocity = y_vel.to_f64
        @gravity = gravity.to_f64
        @meter = meter.to_i

        @callback = Proc(PhysObject, PhysObject, Void).new {|a, b| puts "a = #{a}\nb = #{b}"}
        @bounce = bounce.to_f64
    end

    def force(x, y)
        @x_velocity += x * mass
        @y_velocity += y * mass
    end

    def velocity(x = 0, y = 0)
        if x == 0 && y == 0
            return @x_velocity, @y_velocity
        else
        end
    end

    def update(dt)
        @y_velocity += dt * @gravity * @meter
    end
end