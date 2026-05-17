class Jugador
  attr_accessor :vida, :inventario

  attr_reader :nombre

  def initialize(nombre_inicial)
    @nombre = nombre_inicial
    @vida = 100
    @inventario = []
  end


end