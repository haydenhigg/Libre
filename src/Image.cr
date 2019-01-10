require "./Bindings"
require "./Structures"
require "./Keys"

class Image
    def self.load(filename)
        puts("CRYSTAL-INFO: Image loading.")
        return Libray.load_image(filename)
    end
    def self.unload(image : ImageObject)
        Libray.unload_image(image)
    end
end

class Texture
    def self.load(filename)
        puts("CRYSTAL-INFO: Texture loading.")
        return Libray.load_texture(filename)
    end
    def self.load_from_image(image : ImageObject)
        puts("CRYSTAL-INFO: Texture loading from image.")
        return Libray.load_texture_from_image(image)
    end
    def self.unload(texture : Texture2D)
        Libray.unload_texture(texture)
    end
end