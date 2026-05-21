class Objeto

  attr_reader :nombre, :precio, :tipo

  def initialize(nombre, precio, tipo)
    @nombre = nombre
    @precio = precio
    @tipo = tipo
  end

end