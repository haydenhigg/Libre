require "./Bindings"
require "./Structures"
require "./Keys"
require "./Window"

class Keyboard
    def self.is_pressed?(key : Int32)
        Libray.key_down?(key)
    end
end

class Mouse
    def self.get_pos
        return Libray.get_mouse_pos()
    end
    def self.get_x
        return get_pos.x
    end
    def self.get_y
        return get_pos.y
    end
    def self.set_pos(point : Point2D)
        Libray.set_mouse_pos(point)
    end
    def self.set_pos(x : Int32, y : Int32)
        Libray.set_mouse_pos(new_Point2D(x, y))
    end
    def self.set_x(x : Int32)
        Libray.set_mouse_pos(new_Point2D(x, get_y))
    end
    def self.set_y(y : Int32)
        Libray.set_mouse_pos(new_Point2D(get_x, y))
    end

    def self.is_pressed?(button : Int32)
        Libray.is_mouse_down(button)
    end

    def self.cursor_visible(vis = "get")
        if vis == "get"
            return !Libray.cursor_is_hidden
        elsif vis
            Libray.show_cursor()
        elsif !vis
            Libray.hide_cursor()
        end
    end

    def self.is_in_window?
        if get_x <= Window.width && get_x >= 0 && get_y <= Window.height && get_y >= 0
            return true
        else
            return false
        end
    end

    def self.is_on?(rec : Rectangle)                       # add more overloads
        Libray.check_rect_collision(get_pos, rec)
    end
    def self.is_on?(square : Square)
        s = Rectangle.new

        s.x = square.x
        s.y = square.y
        s.width = square.size
        s.height = square.size

        Libray.check_rect_collision(get_pos, s)
    end
    def self.is_on?(circle : Circle)
        Libray.check_circle_collision(get_pos, new_Point2D(circle.x, circle.y), circle.radius)
    end
    def self.is_on?(triangle : Triangle)
        Libray.check_triangle_collision(get_pos, new_Point2D(triangle.x1, triangle.y1), new_Point2D(triangle.x2, triangle.y2), new_Point2D(triangle.x3, triangle.y3))
    end
end