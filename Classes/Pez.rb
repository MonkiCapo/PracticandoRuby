class Pez
    attr_reader :nombre, :peso, :rareza, :precio

  def initialize(nombre, peso, rareza, precio)
    @nombre = nombre
    @peso = peso
    @rareza = rareza
    @precio = precio
  end
end
