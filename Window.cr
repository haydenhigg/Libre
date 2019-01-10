require "./Bindings"
require "./Structures"
require "./Keys"

class Window
    def self.width
        return Libray.get_screen_width()
    end
    def self.height
        return Libray.get_screen_height()
    end

    def self.init(width : Int32, height : Int32, title : String = "Libre")
        Libray.init_window(width, height, title)
        puts "CRYSTAL-INFO: Window created successfully."
    end
    def self.close
        Libray.close_window()
        puts "CRYSTAL-INFO: Window closed successfully."
    end

    def self.should_close?
        Libray.window_close?
    end

    def self.set_fps(fps : Int32)
        Libray.set_fps(fps)
        puts "CRYSTAL-INFO: Window fps set to #{fps}."
    end
    def self.set_flags(flags)
        if flags.is_a?(Array(Int32))
            flags = flags.map {|i| i = i.to_u8}
        else
            flags = [flags.to_u8]
        end

        Libray.set_config_flags(flags)
    end
end