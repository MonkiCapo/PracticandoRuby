def menu_stats(jugador)
  limpiar_pantalla
  jugador.mostrar_stats
end

def menu_inv_peces(jugador)
  limpiar_pantalla
  jugador.mostrar_inv_peces
end

def menu_inv_objetos(jugador)
  limpiar_pantalla
  jugador.mostrar_inv_objetos
end

def opciones_pesca
  puts "Entonces qué te gustaría hacer?"
  puts "1. Ver tus stats"
  puts "2. Ver tu inventario"
  puts "3. Pescar!!!"
  puts "4. Irte también de aca? 😭"
end

def opciones_inventario
  puts "Qué te gustaría ver de tu inventario?"
  puts "1. Peces"
  puts "2. Objetos"
  puts "3. Volver"
end