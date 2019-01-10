require "./Bindings"
require "./Structures"
require "./Keys"
require "./Color"

class Graphics
    @@color = Color.black

    def self.set_color(color : ColorObject)
        @@color = color
    end
    
    def self.clear_background(color = @@color)
        Libray.clear_background(color.not_nil!)
    end

    def self.start
        Libray.begin_drawing
    end
    def self.stop
        Libray.end_drawing
    end

    def self.draw_on_rectangle(texture : Texture2D, posX : Int32, posY : Int32, source_rec : Rectangle, tint = @@color)
        Libray.texture_on_rect(texture, source_rec, new_Point2D(posX, posY), tint.not_nil!)
    end
    def self.draw_on_rectangle(texture : Texture2D, pos : Point2D, source_rec : Rectangle, tint = @@color)
        Libray.texture_on_rect(texture, source_rec, pos, tint.not_nil!)
    end
    # def self.draw_scaled(texture : Texture2D, posX : Int32, posY : Int32, source_rec : Rectangle)
    #     Libray.texture_on_rect(texture, source_rec, new_Point2D(posX, posY), Color.clear)
    # end
    # def self.draw_scaled(texture : Texture2D, pos : Point2D, source_rec : Rectangle)
    #     Libray.texture_on_rect(texture, source_rec, pos, Color.clear)
    # end

    def self.point(posX : Int32, posY : Int32, color = @@color)
        Libray.draw_point(new_Point2D(posX, posY), color)
    end
    def self.point(pos : Point2D, color = @@color)
        Libray.draw_point(pos, color)
    end

    def self.text(text : LibC::Char*, x : Int32, y : Int32, font_size : Int32, color = @@color)                 # TEXT
        Libray.draw_text(text, x, y, font_size, color.not_nil!)
    end
    def self.text(text : LibC::Char*, position : Point2D, font_size : Int32, color = @@color)
        Libray.draw_text(text, position.x, position.y, font_size, color.not_nil!)
    end
    def self.text(text : String, x : Int32, y : Int32, font_size : Int32, color = @@color)
        Libray.draw_text(text.to_u8_ptr, x, y, font_size, color.not_nil!)
    end
    def self.text(text : String, position : Point2D, font_size : Int32, color = @@color)
        Libray.draw_text(text.to_u8_ptr, position.x, position.y, font_size, color.not_nil!)
    end

    def self.circle(mode : String, center : Point2D, radius, color = @@color)                                   # CIRCLE
        if mode.downcase == "fill"
            Libray.draw_circle(center, radius.to_f, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_circle(center.x, center.y, radius.to_f, color.not_nil!)
        end
    end
    def self.circle(mode : String, x, y, radius, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_circle(new_Point2D(x, y), radius.to_f, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_circle(x, y, radius.to_f, color.not_nil!)
        end
    end
    def self.circle(mode : String, circle : Circle, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_circle(new_Point2D(circle.x, circle.y), circle.radius.to_f, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_circle(circle.x, circle.y, circle.radius.to_f, color.not_nil!)
        end
    end

    def self.rectangle(mode : String, posX, posY, width, height, color = @@color)                                   # RECTANGLE
        if mode.downcase == "fill"
            Libray.draw_rectangle(posX.to_i, posY.to_i, width.to_i, height.to_i, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_rect(posX.to_i, posY.to_i, width.to_i, height.to_i, color.not_nil!)
        end
    end
    def self.rectangle(mode : String, position : Point2D, width, height, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_rectangle(position.x.to_i, position.y.to_i, width.to_i, height.to_i, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_rect(position.x.to_i, position.y.to_i, width.to_i, height.to_i, color.not_nil!)
        end
    end
    def self.rectangle(mode : String, position : Point2D, size : Vector2, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_rectangle(positions.x.to_i, position.y.to_i, size.x.to_i, size.y.to_i, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_rect(positions.x.to_i, position.y.to_i, size.x.to_i, size.y.to_i, color.not_nil!)
        end
    end
    def self.rectangle(mode : String, rectangle : Rectangle, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_rectangle(rectangle.x.to_i, rectangle.y.to_i, rectangle.width.to_i, rectangle.height.to_i, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_rect(rectangle.x.to_i, rectangle.y.to_i, rectangle.width.to_i, rectangle.height.to_i, color.not_nil!)
        end
    end
    # def self.rectangle(mode : String, )              # ad_rectangle with rotation

    def self.square(mode : String, posX, posY, size, color = @@color)                                              # SQUARE
        if mode.downcase == "fill"
            Libray.draw_rectangle(posX.to_i, posY.to_i, size.to_i, size.to_i, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_rect(posX.to_i, posY.to_i, size.to_i, size.to_i, color.not_nil!)
        end
    end
    def self.square(mode : String, position : Point2D, size, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_rectangle(position.x.to_i, position.y.to_i, size.to_i, size.to_i, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_rect(position.x.to_i, position.y.to_i, size.to_i, size.to_i, color.not_nil!)
        end
    end
    def self.square(mode : String, square : Square, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_rectangle(square.x.to_i, square.y.to_i, square.size.to_i, square.size.to_i, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_rect(square.x.to_i, square.y.to_i, square.size.to_i, square.size.to_i, color.not_nil!)
        end
    end

    def self.triangle(mode : String, x1, y1, x2, y2, x3, y3, color = @@color)                                      # TRIANGLE
        if mode.downcase == "fill"
            Libray.draw_triangle(new_Point2D(x1, y1), new_Point2D(x2, y2), new_Point2D(x3, y3), color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_triangle(new_Point2D(x1, y1), new_Point2D(x2, y2), new_Point2D(x3, y3), color.not_nil!)
        end
    end
    def self.triangle(mode : String, v1 : Point2D, v2 : Point2D, v3 : Point2D, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_triangle(v1, v2, v3, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_triangle(v1, v2, v3, color.not_nil!)
        end
    end
    def self.triangle(mode : String, triangle : Triangle, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_triangle(new_Point2D(triangle.x1, triangle.y1), new_Point2D(triangle.x2, triangle.y2), new_Point2D(triangle.x3, triangle.y3), color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_triangle(new_Point2D(triangle.x1, triangle.y1), new_Point2D(triangle.x2, triangle.y2), new_Point2D(triangle.x3, triangle.y3), color.not_nil!)
        end
    end

    def self.regular_polygon(center : Point2D, sides : Int32, radius : LibC::Float, rotation, color = @@color)
        Libray.draw_reg_poly(center, sides, radius, rotation.to_f, color.not_nil!)
    end
    def self.regular_polygon(x : LibC::Float, y : LibC::Float, sides : Int32, radius : LibC::Float, rotation, color = @@color)
        Libray.draw_reg_poly(new_Point2D(x, y), sides, radius, rotation.to_f, color.not_nil!)
    end
    def self.regular_polygon(reg_poly : RegularPolygon, color = @@color)
        if reg_poly.x == nil && reg_poly.y == nil
            Libray.draw_reg_poly(reg_poly.center, reg_poly.sides, reg_poly.radius, reg_poly.rotation, color.not_nil!)
        else
            Libray.draw_reg_poly(new_Point2D(reg_poly.x, reg_poly.y), reg_poly.sides, reg_poly.radius, reg_poly.rotation, color.not_nil!)
        end
    end

    def self.polygon(mode : String, points : Array(Point2D), color = @@color)
        if mode.downcase == "fill"
            Libray.draw_poly(points, points.size, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_poly(points, points.size, color.not_nil!)
        end
    end
    def self.polygon(mode : String, polygon : Polygon, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_poly(polygon.points, polygon.num_points, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_poly(polygon.points, polygon.num_points, color.not_nil!)
        end
    end
    def self.polygon(mode : String, *points, color = @@color)
        points = points.each_slice(2).to_a.map {|pair| pair = new_Point2D(pair[0], pair[1])}

        if mode.downcase == "fill"
            Libray.draw_poly(points, points.size, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_poly(points, points.size, color.not_nil!)
        end
    end

    def self.draw(mode : String, rectangle : Rectangle, color = @@color)                                                # DRAW
        if mode.downcase == "fill"
            Libray.draw_rectangle(rectangle.x.to_i, rectangle.y.to_i, rectangle.width.to_i, rectangle.height.to_i, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_rect(rectangle.x.to_i, rectangle.y.to_i, rectangle.width.to_i, rectangle.height.to_i, color.not_nil!)
        end
    end
    def self.draw(mode : String, square : Square, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_rectangle(square.x.to_i, square.y.to_i, square.size.to_i, square.size.to_i, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_rect(square.x.to_i, square.y.to_i, square.size.to_i, square.size.to_i, color.not_nil!)
        end
    end
    def self.draw(mode : String, circle : Circle, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_circle(new_Point2D(circle.x, circle.y), circle.radius.to_f, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_circle(circle.x, circle.y, circle.radius.to_f, color.not_nil!)
        end
    end
    def self.draw(mode : String, triangle : Triangle, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_triangle(new_Point2D(triangle.x1, triangle.y1), new_Point2D(triangle.x2, triangle.y2), new_Point2D(triangle.x3, triangle.y3), color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_triangle(new_Point2D(triangle.x1, triangle.y1), new_Point2D(triangle.x2, triangle.y2), new_Point2D(triangle.x3, triangle.y3), color.not_nil!)
        end
    end
    def self.draw(reg_poly : RegularPolygon, color = @@color)
        if reg_poly.x == nil && reg_poly.y == nil
            Libray.draw_reg_poly(reg_poly.center, reg_poly.sides, reg_poly.radius, reg_poly.rotation, color.not_nil!)
        else
            Libray.draw_reg_poly(new_Point2D(reg_poly.x, reg_poly.y), reg_poly.sides, reg_poly.radius, reg_poly.rotation, color.not_nil!)
        end
    end
    def self.draw(mode : String, polygon : Polygon, color = @@color)
        if mode.downcase == "fill"
            Libray.draw_poly(polygon.points, polygon.num_points, color.not_nil!)
        elsif mode.downcase == "line"
            Libray.draw_line_poly(polygon.points, polygon.num_points, color.not_nil!)
        end
    end
    def self.draw(texture : Texture2D, posX : Int32, posY : Int32, tint = @@color)
        Libray.draw_texture(texture, posX, posY, tint.not_nil!)
    end
    def self.draw(texture : Texture2D, pos : Point2D, tint = @@color)
        Libray.draw_texture(texture, pos.x, pos.y, tint.not_nil!)
    end
    def self.draw(texture : Texture2D, posX : Int32, posY : Int32, rotation, scale, tint = @@color)
        Libray.draw_texture_ad(texture, new_Point2D(posX, posY), rotation.to_f, scale.to_f, tint.not_nil!)
    end
    def self.draw(texture : Texture2D, pos : Point2D, rotation, scale, tint = @@color)
        Libray.draw_texture_ad(texture, pos, rotation.to_f, scale.to_f, tint.not_nil!)
    end
end