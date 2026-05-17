class Pez
    attr_reader :nombre, :peso, :rareza

  def initialize(nombre, peso, rareza)
    @nombre = nombre
    @peso = peso
    @rareza = rareza
  end
end
