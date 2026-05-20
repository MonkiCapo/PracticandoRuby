require_relative 'Pez.rb'
require_relative '../Data/PecesCreados.rb'
require 'timeout'

class Jugador


  attr_accessor :vida, :inventario, :dinero

  attr_reader :nombre

  def initialize(nombre_inicial)
    @nombre = nombre_inicial
    @vida = 100
    @inventario = []
    @dinero = 0
  end

  def mostrar_stats
    puts "Bueno, observalas bien entonces\n "
    puts "Nombre: #{@nombre}"
    puts "Vida: #{@vida}\n "
  end

  def mostrar_inv
    if @inventario.empty?
      puts "."
      sleep(1.5)
      puts "."
      sleep(1.5)
      puts "."
      sleep(1.5)
      puts "Estamos secos de pescados eh, #{@nombre}. O los vendiste todos, o no pescaste así que anda y pesca!"
    else
      puts "Tenes estos peces:\n "
      @inventario.each do |pez|
      puts "#{pez.nombre} - #{pez.peso}kg - #{pez.rareza} - $#{pez.precio}"
      end
      puts ""
    end
  end

  def pescar
    puts "."
    sleep(1.5)

    puts "."
    sleep(1.5)

    puts "."
    sleep(1.5)

    puts "AGARRASTE ALGO, PRESIONA ENTER RÁPIDO"

    begin 
      Timeout.timeout(3) do
        gets
      end
    rescue Timeout::Error
      puts "Se te escapo el pez..."
      return
    end

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

    @inventario << pez_pescado
  end

  def agregardinero(monto)
    @dinero += monto
  end
end