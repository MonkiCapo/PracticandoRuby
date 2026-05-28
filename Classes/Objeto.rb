class Objeto
  attr_reader :nombre, :precio, :tipo
  attr_accessor :stock # Modificable para poder sumar o restar cantidad

  def initialize(nombre, precio, tipo, stock = 1)
    @nombre = nombre
    @precio = precio
    @tipo = tipo
    @stock = stock
  end
end