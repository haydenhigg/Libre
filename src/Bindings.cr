@[Link("raylib")]
lib Libray
    struct Color
        r : LibC::UChar
        g : LibC::UChar
        b : LibC::UChar
        a : LibC::UChar
    end

    struct Vector2
        x : LibC::Float
        y : LibC::Float
    end

    struct Rectangle
        x : LibC::Float
        y : LibC::Float
        width : LibC::Float
        height : LibC::Float
    end

    struct Square
        x : LibC::Float
        y : LibC::Float
        size : LibC::Float
    end

    struct Circle
        x : LibC::Float
        y : LibC::Float
        radius : LibC::Float
    end

    struct Triangle
        x1 : LibC::Float
        y1 : LibC::Float

        x2 : LibC::Float
        y2 : LibC::Float

        x3 : LibC::Float
        y3 : LibC::Float
    end

    struct Polygon
        points : Vector2*
        num_points : Int32
    end

    struct RegularPolygon
        center : Vector2
        sides : Int32
        radius : LibC::Float
        rotation : Int32
        x : LibC::Float
        y : LibC::Float
    end

    struct Image
        data : Void*
        width : Int32
        height : Int32
        mipmaps : Int32
        format : Int32
    end

    struct Texture2D
        id : UInt32
        width : Int32
        height : Int32
        mipmaps : Int32
        format : Int32
    end

    struct CharInfo
        value : Int32
        rec : Rectangle
        offsetX : Int32
        offsetY : Int32
        advanceX : Int32
        data : LibC::UChar*
    end

    struct Font
        texture : Texture2D     # font texture
        baseSize : Int32        # default char height
        charsCount : Int32      # number of characters
        chars : CharInfo        # character info data
    end

    # Window
    fun init_window = InitWindow(width : Int32, height : Int32, title : LibC::Char*) : Void
    fun set_config_flags = SetConfigFlags(flags : LibC::UChar*) : Void
    fun close_window = CloseWindow() : Void
    fun window_close? = WindowShouldClose() : Bool
    fun set_fps = SetTargetFPS(fps : Int32) : Void
    fun get_screen_width = GetScreenWidth() : Int32
    fun get_screen_height = GetScreenHeight() : Int32

    # Drawing
    fun clear_background = ClearBackground(color : Color) : Void
    fun begin_drawing = BeginDrawing() : Void
    fun end_drawing = EndDrawing() : Void
    fun draw_circle = DrawCircleV(center : Vector2, radius : Float32, color : Color) : Void
    fun draw_rectangle = DrawRectangle(posX : Int32, posY : Int32, width : Int32, height : Int32, color : Color) : Void
    fun draw_triangle = DrawTriangle(v1 : Vector2, v2 : Vector2, v3 : Vector2, color : Color) : Void
    fun draw_line_circle = DrawCircleLines(centerX : Int32, centerY : Int32, radius : LibC::Float, color : Color) : Void
    fun draw_line_rect = DrawRectangleLines(posX : Int32, posY : Int32, width : Int32, height : Int32, color : Color) : Void
    fun draw_line_triangle = DrawTriangleLines(v1 : Vector2, v2 : Vector2, v3 : Vector2, color : Color) : Void
    fun draw_reg_poly = DrawPoly(center : Vector2 , sides : Int32, radius : LibC::Float, rotation : LibC::Float, color : Color) : Void
    fun draw_poly = DrawPolyEx(points : Vector2*, numPoints : Int32, color : Color) : Void
    fun draw_line_poly = DrawPolyExLines(points : Vector2*, numPoints : Int32, color : Color) : Void
    fun draw_point = DrawPixelV(pos : Vector2, color : Color) : Void

    # Mouse/Keyboard
    fun key_down? = IsKeyDown(key : Int32) : Bool
    fun get_mouse_pos = GetMousePosition() : Vector2
    fun is_mouse_down = IsMouseButtonPressed(button : Int32) : Bool
    fun check_rect_collision = CheckCollisionPointRec(point : Vector2, rec : Rectangle) : Bool
    fun check_circle_collision = CheckCollisionPointCircle(point : Vector2, center : Vector2, radius : LibC::Float) : Bool
    fun check_triangle_collision = CheckCollisionPointTriangle(point : Vector2, p1 : Vector2, p2 : Vector2, p3 : Vector2) : Bool
    fun cursor_is_hidden = IsCursorHidden() : Void
    fun hide_cursor = HideCursor() : Void
    fun show_cursor = ShowCursor() : Void
    fun set_mouse_pos = SetMousePosition(point : Vector2) : Void

    # Image
    fun load_image = LoadImage(filename : LibC::Char*) : Image
    fun load_texture = LoadTexture(filename : LibC::Char*) : Texture2D
    fun load_texture_from_image = LoadTextureFromImage(image : Image) : Texture2D
    fun unload_image = UnloadImage(image : Image) : Void
    fun unload_texture = UnloadTexture(texture : Texture2D) : Void
    fun draw_texture = DrawTexture(texture : Texture2D, posX : Int32, posY : Int32, tint : Color) : Void
    fun draw_texture_ad = DrawTextureEx(texture : Texture2D, position : Vector2, rotation : LibC::Float, scale : LibC::Float, tint : Color) : Void
    fun texture_on_rect = DrawTextureRec(texture : Texture2D, source_rec : Rectangle, position : Vector2, tint : Color) : Void

    # Text
    fun draw_text = DrawText(text : LibC::Char*, posX : Int32, posY : Int32, fontSize : Int32, color : Color) : Void
    # fun load_spritefont = LoadSpriteFont()
end