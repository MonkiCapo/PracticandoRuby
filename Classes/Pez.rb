class Pez
    attr_reader :nombre, :pesoMin, :pesoMax :rareza

  def initialize(nombre, pesoMin, pesoMax, rareza)
    @nombre = nombre
    @pesoMin = pesoMin
    @pesoMax = pesoMax
    @rareza = rareza
  end
end
