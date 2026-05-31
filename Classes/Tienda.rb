class Tienda

    attr_accessor :inventarioTienda

    attr_reader :nombre

    def initialize(nombreTienda)
        @nombre = nombreTienda
        @inventarioTienda = []
    end

    def mostrar_items
        @inventarioTienda.each do |objeto|
            puts "Artículo: #{objeto.nombre} - Precio: $#{objeto.precio} - Stock: #{objeto.stock} - Tipo: #{objeto.tipo}"
        end
    end

    def mostrar_inv_tienda
        mostrar_items
    end

    def comprar_item(jugador, item)
        # Buscamos el objeto en el inventario de la tienda
        # (funciona si pasas el objeto mismo o solo el nombre como string)
        objeto_tienda = @inventarioTienda.find do |obj| 
            obj == item || obj.nombre.downcase == item.to_s.downcase 
        end

        if objeto_tienda.nil?
            puts "Lo siento, la tienda no vende ese artículo."
            return false
        end

        if objeto_tienda.stock <= 0
            puts "¡Lo siento! El artículo '#{objeto_tienda.nombre}' está agotado."
            return false
        end

        if jugador.dinero < objeto_tienda.precio
            puts "No tenés suficiente dinero para comprar '#{objeto_tienda.nombre}'."
            puts "Precio: $#{objeto_tienda.precio} | Tu dinero: $#{jugador.dinero}"
            return false
        end

        # Procesar compra
        jugador.dinero -= objeto_tienda.precio
        objeto_tienda.stock -= 1
        
        # Agregamos el objeto al inventario del jugador
        # Usamos el método ganar_objeto que ya implementaste en la clase Jugador
        jugador.ganar_objeto(objeto_tienda, 1)

        puts "¡Compraste 1 '#{objeto_tienda.nombre}' con éxito por $#{objeto_tienda.precio}!"
        puts "Dinero restante: $#{jugador.dinero} | Stock restante en tienda: #{objeto_tienda.stock}"
        return true
    end

end