require "./Bindings"
require "./Structures"
require "./Keys"

class Color
    private def self.createColor(r : Int32, g : Int32, b : Int32, a : Int32)
        c = ColorObject.new

        c.r = r.to_u8
        c.g = g.to_u8
        c.b = b.to_u8
        if a.nil?
            c.a = 255_u8
        else
            c.a = a.to_u8
        end

        return c
    end

    def self.red
        return createColor(230, 41, 55, 255)
    end
    def self.orange
        return createColor(255, 161, 0, 255)
    end
    def self.yellow
        return createColor(253, 249, 0, 255)
    end
    def self.green
        return createColor(0, 228, 48, 255)
    end
    def self.blue
        return createColor(0, 121, 241, 255)
    end
    def self.purple
        return createColor(200, 122, 255, 255)
    end
    def self.violet
        return createColor(135, 60, 190, 255)
    end
    def self.white
        return createColor(255, 255, 255, 255)
    end
    def self.raywhite
        return createColor(245, 245, 245, 255)
    end
    def self.black
        return createColor(0, 0, 0, 255)
    end
    def self.gray
        return createColor(130, 130, 130, 255)
    end
    def self.lightgray
        return createColor(200, 200, 200, 255)
    end
    def self.darkblue
        return createColor(0, 82, 172, 255)
    end
    def self.darkbrown
        return createColor(76, 63, 47, 255)
    end
    def self.darkgray
        return createColor(80, 80, 80, 255)
    end
    def self.darkgreen
        return createColor(0, 117, 44, 255)
    end
    def self.maroon
        return createColor(190, 33, 55, 255)
    end
    def self.darkpurple
        return createColor(112, 31, 126, 255)
    end
    def self.brown
        return createColor(127, 106, 79, 255)
    end
    def self.pink
        return createColor(255, 109, 194, 255)
    end
    def self.magenta
        return createColor(255, 0, 255, 255)
    end
    def self.lime
        return createColor(0, 158, 47, 255)
    end
    def self.gold
        return createColor(255, 203, 0, 255)
    end
    def self.skyblue
        return createColor(102, 191, 255, 255)
    end
    def self.beige
        return createColor(211, 176, 131, 255)
    end
    def self.clear
        return createColor(0, 0, 0, 0)
    end
    def self.random
        return createColor(rand(255), rand(255), rand(255), 255)
    end

    def self.get_color(color : ColorObject)
        return [color.r.to_i, color.g.to_i, color.b.to_i, color.a.to_i]
    end

    def self.create(r : Int32, g : Int32, b : Int32, a = 255)
        return createColor(r, g, b, a)
    end
end