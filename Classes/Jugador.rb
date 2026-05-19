require_relative 'Pez.rb'
require_relative '../Data/PecesCreados.rb'

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
      puts "#{pez.nombre} - #{pez.peso}kg - #{pez.rareza}"
      end
      puts ""
    end
  end

  def pescar
    puts "1..."
    sleep(1.5)
    puts "2..."
    sleep(1.5)
    puts "3..."
    sleep(1.5)
    puts "AGARRASTE ALGO!"
    pez = PECES.sample
    sleep(2)
    puts "Pescaste un #{pez.nombre}!!!\n "
    @inventario << pez
  end

  def agregardinero(monto)
    @dinero += monto
  end
end