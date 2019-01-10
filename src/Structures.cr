require "./Bindings"

alias ColorObject = Libray::Color

alias Texture2D = Libray::Texture2D
alias ImageObject = Libray::Image

alias Point2D = Libray::Vector2
alias Square = Libray::Square
alias Circle = Libray::Circle
alias Triangle = Libray::Triangle
alias Polygon = Libray::Polygon
alias RegularPolygon = Libray::RegularPolygon
alias SpriteFont = Libray::Font

def new_Point2D(x, y)
    v2 = Point2D.new

    v2.x = x.to_f
    v2.y = y.to_f

    return v2
end

class ::String
    def to_u8_ptr
        Pointer.malloc(self.size) { |i| (self[i].ord).to_u8 }
    end
end