require_relative 'Pez.rb'
require_relative 'Objeto.rb'
require_relative '../Ruby/Metodos/Metodos.rb'
require_relative '../Data/PecesCreados.rb'
require_relative '../Data/ObjetosCreados.rb'
require 'timeout'

class Jugador


  attr_accessor :vida, :peces, :dinero, :caña, :objetos

  attr_reader :nombre

  def initialize(nombre_inicial)
    @nombre = nombre_inicial
    @vida = 100
    @peces = []
    @dinero = 0
    @caña = nil
    @objetos = []
  end

  def mostrar_stats
    puts "Bueno, observalas bien entonces\n "
    puts "Nombre: #{@nombre}"
    puts "Vida: #{@vida}\n "
  end

  def mostrar_inv_peces
    if @peces.empty?
      esperar()
      puts "Estamos secos de pescados eh, #{@nombre}. O los vendiste todos, o no pescaste así que anda y pesca!"
    else
      puts "Tenes estos peces:\n "
      @peces.each do |pez|
        puts "#{pez.nombre} - #{pez.peso}kg - #{pez.rareza} - $#{pez.precio}"
        end
      puts ""
    end
  end

  def mostrar_inv_objetos
    if @objetos.empty?
      puts "No tenés ningún objeto en tu inventario."
    else
      puts "Estos son los objetos que tenes:\n "
      
      @objetos.each do |objeto|
        puts "#{objeto.nombre} x#{objeto.stock} - Tipo: #{objeto.tipo}"
      end
    end
    puts ""
  end

  def reaccion_pesca
    begin 
      Timeout.timeout(3) do
        gets
      end
        rescue Timeout::Error
        puts "Se te escapo el pez..."
        return false
      else
        return true
    end
  end

  def hay_cebo(cebo)
    cebo_existente = @objetos.find do |obj|
      obj.tipo == "Cebo" && obj.stock > 0
    end

    if cebo_existente
      cebo_existente.stock -= 1

      if cebo_existente.stock <= 0
      @objetos.delete(cebo_existente)
      end

      return true

    else
      puts "No tenes ningún cebo... No te conviene comprar?"
      return false
    end
  end

  def pescar_pez_randomYguardar

    resultado = reaccion_pesca

    return unless resultado

    datos_pez = PECES.sample

    peso_generado = rand(datos_pez[:peso_min]..datos_pez[:peso_max]).round(2)

    precio_final = (peso_generado * datos_pez[:precio_kilo]).round

    pez_pescado = Pez.new(
      datos_pez[:nombre],
      peso_generado,
      datos_pez[:rareza],
      precio_final
    )

    puts "Pescaste un #{pez_pescado.nombre}!"
    puts "Peso: #{pez_pescado.peso}kg"
    puts "Rareza: #{pez_pescado.rareza}"
    puts "Valor: $#{pez_pescado.precio}\n "

    @peces << pez_pescado

  end

  def pescar
    return unless hay_cebo(@objetos.find { |obj| obj.tipo == "Cebo" })
    
    esperar()

    puts "AGARRASTE ALGO, PRESIONA ENTER RÁPIDO"

    pescar_pez_randomYguardar()
  end

  def agregardinero(monto)
    puts "Recibiste #{monto}!"
    @dinero += monto
  end

  def ganar_objeto(objeto_nuevo, stock = 1)
    # Buscamos si ya tenemos un objeto con el mismo nombre en el arreglo
    objeto_existente = @objetos.find { |obj| obj.nombre == objeto_nuevo.nombre }

    if objeto_existente
      # Si ya existe, solo sumamos al stock existente
      objeto_existente.stock += stock
    else
      # Si no existe, usamos .dup para "duplicar/clonar" el objeto base 
      # y no modificar el objeto original que está en el archivo de DATA.
      objeto_clonado = objeto_nuevo.dup
      objeto_clonado.stock = stock
      @objetos << objeto_clonado
    end
  end

  def entregar_kit_inicial
    # Entrega 1 Caña Vieja
    ganar_objeto(OBJETOS[0], 1)

    # Entrega 5 Cebos
    ganar_objeto(OBJETOS[1], 5)
  end

  

end