# Libre

A Crystal graphics library that is built on Raylib.

## Usage

If on Unix systems (mac, Linux, etc.), you can run `git clone https://github.com/haydenhigg/Libre` while within your project. Then, put this at the top of your file:
```ruby
require "./Libre/src/*"
```

## Color

You can't provide colors to any graphics methods except with a ColorObject, which is what all of these methods return.

### Creating colors

Call
```ruby
Color.create(r, g, b, a) # if a is not defined, then it's 255 
```

### Using built-in colors

You can use any of 26 built-in colors, created with RGB values that are consistent with Raylib's.
```ruby
Color.red
Color.orange
Color.yellow
Color.green
Color.blue
Color.purple
Color.violet
Color.white
Color.raywhite # this is the color that many Raylib examples use, it is very close to white - rgb(245, 245, 245, 255)
Color.black
Color.gray
Color.lightgray
Color.darkblue
Color.darkbrown
Color.darkgray
Color.darkgreen
Color.maroon
Color.darkpurple
Color.brown
Color.pink
Color.magenta
Color.lime
Color.gold
Color.skyblue
Color.beige
Color.clear
```

### Finding the RGB value of a ColorObject

Call
```ruby
Color.get_color(color)
```
to get an array of [r, g, b, a]

## Graphics

### The flow of graphics

#### Starting and stopping

Use
```ruby
Graphics.start # to start being able to use Graphics commands
Graphics.stop # to stop using Graphics commands
```

#### Default colors

Every graphics command requires a color, but if you want to set a default color that will be used for almost every method, use
```ruby
Graphics.set_color(color) # and of course color should be a ColorObject
```
In the rest of this documentation I will use the word "color" to represent (in method signatures) where you can optionally use a ColorObject argument, or just exclude that argument to use the default color.

#### Point2D

Almost every graphics command requires a position. There are multiple overloads for most methods, and they can take either separate x and y arguments, or a Point2D. Point2D is a wrapper of Raylib's Vector2, so it doesn't have an initialize method as with all of the other wrapper structs. As such, to create a Point2D, use
```ruby
new_Point2D(x, y)
```
In the rest of this documentation I will use the word "point" to represent (in method signatures) where you can either use a Point2D, or separate x and y arguments.

#### Shape drawing mode

The first argument of most of the drawing commands is a String which is the drawing mode for that shape. The drawing mode can be either "fill", or "line", which are a filled-in shape and just an outline, respectively. In the rest of this documentation I will use the word "mode" to represent (in method signatures) where you must use one of these modes.

### Point

```ruby
Graphics.point(point, color)
```

### Text

Message can be a LibC::Char* (which is a Pointer(UInt8) to Crystal) or String. When passing a String, it is converted to a Pointer(UInt8) with the added method ::String.to_u8_ptr, which you can use as well if necessary.
```ruby
Graphics.text(message, point, font-size, color)
```

### Circle

```ruby
Graphics.circle(mode, point, radius, color)
```
or
```ruby
Graphics.circle(mode, circle, color)
```
where "circle" is a Circle struct, another wrapper struct from the bindings. You can't initialize any of these types of structs with arguments, so if you did want to use a Circle, then you must do something like
```ruby
circle_to_draw = Circle.new
circle.x = x            ## float
circle.y = y            ## float
circle.radius = radius  ## float
```

### Rectangle

```ruby
Graphics.rectangle(mode, point, width, height, color) # you can also use a Vector2 to describe the width and height. the x attribute is width and the y attribute is height
```
or
```ruby
Graphics.rectangle(mode, rectangle, color)
```
where "rectangle" is a Rectangle struct, another wrapper struct from the bindings. While Circle has x, y, and radius attributes, Rectangle has x, y, width, and height attributes.

### Square

Squares are just rectangles that have an attribute size to replace the width and height attributes. Use
```ruby
Graphics.square(mode, point, size, color)
```
or
```ruby
Graphics.square(mode, square, color)
```
where "square" is a Square struct with x, y, and size attributes.

###  Triangle

```ruby
Graphics.triangle(mode, point1, point2, point3, color) # remember, the word "point" means that you can use a Vector2, a Point2D, or two separate arguments (x and y, in that order)
```
or
```ruby
Graphics.triangle(mode, triangle, color)
```
where "triangle" is a Triangle struct with x1, y1, x2, y2, x3, y3 attributes.

### Regular Polygon

```ruby
Graphics.regular_polygon(point, number-of-sides, radius, rotation, color)
```
or
```ruby
Graphics.regular_polygon(regular-polygon, color)
```
where "regular-polygon" is a RegularPolygon struct with x, y, sides, radius, and rotation attributes.

### Polygon

```ruby
Graphics.polygon(mode, array-of-points, color) # second argument is Array(Point2D)
```
or
```ruby
Graphics.polygon(mode, x-and-y..., color) # like Graphics.polygon("fill", 10, 10, 20, 10, 20, 20, 10, 20, Color.black)
```
or
```ruby
Graphics.polygon(mode, polygon, color)
```
where "polygon" is a Polygon struct with points and num_points attributes (num_points is the number of points in the point array).

### Draw

You can `Graphics.draw` any of the methods that take a struct, and you can draw textures

#### With structs

Just replace `Graphics.polygon` (for example), with `Graphics.draw`
```ruby
Graphics.draw(mode, polygon, color)
```

#### With textures

```ruby
Graphics.draw(texture, point, color) # color is just the tint
```
where "texture" is a Texture2D struct. You shouldn't create these structs by hand, but see the Texture section for information on loading a texture from an image. You can also specify rotation and scale:
```ruby
Graphics.draw(texture, point, rotation, scale, color)
```

## Image

An ImageObject is returned by
```ruby
Image.load(filename)
```
and is unloaded (the resource is released) by
```ruby
Image.unload(image) # image is an ImageObject
```

## Texture

A Texture2D is returned by
```ruby
Texture.load(filename)
```
and
```ruby
Texture.load_from_image(image) # image is an ImageObject
```
and is unloaded by
```ruby
Texture.unload(texture) # texture is a Texture2D
```

## Keyboard

### Check if a key is being held down
```ruby
Keyboard.is_pressed?(key)
```
where key is one of Raylib's keycodes. Some have already been added and exist as constants. The list of those that already exist is
```ruby
KEY_SPACE = 32
KEY_UP = 265
KEY_DOWN = 264
KEY_LEFT = 263
KEY_RIGHT = 262
KEY_W = 87
KEY_A = 65
KEY_S = 83
KEY_D = 68

KEY_EQUAL = 61
KEY_BACKSPACE = 259
KEY_DELETE = 261
KEY_LSHIFT = 340
KEY_LCONTROL = 341
KEY_LALT = 342
KEY_RSHIFT = 344
KEY_RCONTROL = 345
KEY_RALT = 346
```

## Mouse

### Get position

```ruby
Mouse.get_pos #=> Point2D with x and y attributes
```
or
```ruby
Mouse.get_x
Mouse.get_y
```

### Set position

```ruby
Mouse.set_pos(point)
```
or
```ruby
Mouse.set_x(x)
Mouse.set_y(y)
```

### Check if a button is being held down

```ruby
Mouse.is_pressed(button)
```
where button is again one of Raylib's keycodes. The three defined for mice are
```ruby
MOUSE_LEFT = 0
MOUSE_MIDDLE = 2
MOUSE_RIGHT = 1
```

### Deal with cursor visibility

To set cursor visibility
```ruby
Mouse.cursor_visible(visible) # visible is truthy or falsey
```
and to get cursor_visibility
```ruby
Mouse.cursor_visible #=> true or false
```

### Check if mouse is within bounds

```ruby
Mouse.is_in_window?
```
and
```ruby
Mouse.is_on?(shape)
```
where "shape" is either a Rectangle, a Square, a Circle, or a Triangle.

## Window

### Get dimensions

```ruby
Window.width
Window.height
```

### Control

```ruby
Window.init(width, height, title) # title is optional window label
Window.close
```
and to tell if a close event has been received:
```ruby
Window.should_close?
```

### Setting parameters

To set a Window's update rate, use
```ruby
Window.set_fps(fps)
```
and to set a Window's flags (Raylib flags), use
```ruby
Window.set_flags(flags)
```
where flags is an array of constant flags. The defined ones are
```ruby
FLAG_SHOW_LOGO = 1              # Set to show raylib logo at startup
FLAG_FULLSCREEN_MODE = 2        # Set to run program in fullscreen
FLAG_WINDOW_RESIZABLE = 4       # Set to allow resizable window
FLAG_WINDOW_UNDECORATED = 8     # Set to disable window decoration (frame and buttons)
FLAG_WINDOW_TRANSPARENT = 16    # Set to allow transparent window
FLAG_MSAA_4X_HINT = 32          # Set to try enabling MSAA 4X
FLAG_VSYNC_HINT = 64            # Set to try enabling VSYNC
```

## Physics

There is a physics system in development, but to see the existing class PhysObject, which has multiple methods and properties designed to help implement it into said system, go to src/Physics.cr
