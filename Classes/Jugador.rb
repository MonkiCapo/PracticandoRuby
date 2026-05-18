require_relative 'Pez.rb'
require_relative '../Data/PecesCreados.rb'

class Jugador


  attr_accessor :vida, :inventario

  attr_reader :nombre

  def initialize(nombre_inicial)
    @nombre = nombre_inicial
    @vida = 100
    @inventario = []
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
    puts "Pescaste un #{pez.nombre}!!!"
    @inventario << pez
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
      puts "Tenes estos peces:"
      puts ""
      @inventario.each do |pez|
      puts "#{pez.nombre} - #{pez.peso}kg - #{pez.rareza}"
      end
      puts ""
    end
  end
end