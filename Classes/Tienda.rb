class Tienda

    attr_accessor :inventario

    attr_reader :nombre

    def initialize(nombreTienda)
        @nombre = nombreTienda
        @inventarioTienda = []
    end

    def mostrar_items

    end

end