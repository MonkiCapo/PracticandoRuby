require_relative 'Metodos.rb'
require_relative '../../LogicaJuego/Pesca.rb'

def menu_stats(jugador)
  limpiar_pantalla()
  jugador.mostrar_stats
end

def menu_inv_peces(jugador)
  limpiar_pantalla()
  jugador.mostrar_inv_peces
end

def menu_pescar(jugador)
  limpiar_pantalla()
  Pesca.pescar(jugador)
end

def menu_inv_objetos(jugador)
  limpiar_pantalla()
  jugador.mostrar_inv_objetos
end

def menu_inv_cañas(jugador)
    limpiar_pantalla()
    jugador.mostrar_cañas
end

def opciones_pesca
  puts "Entonces qué te gustaría hacer?"
  puts "1. Ver tus stats"
  puts "2. Ver tu inventario"
  puts "3. Pescar!!!"
  puts "4. Ir a la tienda"
  puts "5. Irte también de aca? 😭"
end

def opciones_inventario
  puts "Qué te gustaría ver de tu inventario?"
  puts "1. Peces"
  puts "2. Objetos"
  puts "3. Cañas"
  puts "4. Equipar caña"
  puts "5. Volver"
end

def opciones_tienda
  puts "Bienvenido a la tienda!\n "
  puts "Qué te gustaría hacer?"
  puts "1. Ver objetos"
  puts "2. Comprar objetos"
  puts "3. Volver"
end

def ver_objetos_tienda(tienda)
    limpiar_pantalla()
    puts "--- Objetos en la Tienda ---"
    tienda.mostrar_inv_tienda
    pedir_enter()
    limpiar_pantalla()
end

def menu_comprar_item(jugador, tienda)
    limpiar_pantalla()
    puts "--- Menú de Compra ---"
    tienda.mostrar_inv_tienda
    puts ""
    puts "Tu dinero actual: $#{jugador.dinero}"
    print "Ingresá el nombre del objeto que querés comprar (o escribe 'volver' para cancelar): "
    
    nombre_objeto = gets.chomp
    return if nombre_objeto.downcase == "volver" || nombre_objeto.empty?

    puts ""
    tienda.comprar_item(jugador, nombre_objeto)
    pedir_enter()
    limpiar_pantalla()
end

def menu_tienda(jugador, tienda)
    limpiar_pantalla()
    loop do
        opciones_tienda()
        opcion = gets.chomp

        case opcion
        when "1"
            ver_objetos_tienda(tienda)
        when "2"
            menu_comprar_item(jugador, tienda)
        when "3"
            limpiar_pantalla()
            break
        else
            puts "Opción inválida. Intenta de nuevo por favor."
            sleep(1)
            limpiar_pantalla()
        end
    end
end

def menu_inventario(jugador)
    limpiar_pantalla()
    loop do
        opciones_inventario()
        opcion = gets.chomp

        case opcion
        when "1"
            menu_inv_peces(jugador)
        when "2"
            menu_inv_objetos(jugador)
        when "3"
            menu_inv_cañas(jugador)
        when "4"
            
        when "5"
            limpiar_pantalla()
            break
        else
            puts "Opción inválida. Intenta de nuevo por favor."
            sleep(1)
            limpiar_pantalla()
        end
    end
end