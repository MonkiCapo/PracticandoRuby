require_relative '../Classes/Tienda.rb'
require_relative './ObjetosCreados.rb'

# Creamos la tienda global
TIENDA = Tienda.new("El Almacén del Pescador")

# Buscamos el objeto "Cebo" de nuestra base de datos simulada en ObjetosCreados
cebo_base = OBJETOS.find { |obj| obj.nombre == "Cebo" }

if cebo_base
  # Clonamos el objeto base para asignarle un stock independiente a la tienda
  cebo_tienda = cebo_base.dup
  cebo_tienda.stock = 20 # Stock inicial de cebos en la tienda
  TIENDA.inventarioTienda << cebo_tienda
end
