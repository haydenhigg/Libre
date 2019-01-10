require "./src/*"

# start a 400x300 window, with a title of "Hello World"
Window.init(400, 300, "Hello World")
# set the window's update rate to 60 fps
Window.set_fps(60)

# while the window is open
while !Window.should_close?
    # start using graphics
    Graphics.start

    # fill screen with a color object, in this case ray white
    Graphics.clear_background(Color.raywhite)

    size = 80
    # fill a maroon square;        x      ,        y      , size, color
    Graphics.square("fill", 200 - size / 2, 150 - size / 2, size, Color.maroon)
    # outline a black square
    Graphics.square("line", 200 - size / 2, 150 - size / 2, size, Color.black)
    # put text on screen with default font
    Graphics.text("Hello world!", 168, 146, 12, Color.raywhite)

    # stop using graphics
    Graphics.stop
end

# close window after it has received a close event (such as from pushing the 'x' in the corner of the window)
Window.close