require_relative '../Classes/Jugador.rb'
require_relative '../Classes/Objeto.rb'
require_relative '../Classes/Pez.rb'
require_relative '../Data/PecesCreados.rb'
require_relative '../Data/ObjetosCreados.rb'
require_relative '../Ruby/Metodos/Metodos.rb'
require 'timeout'

class Pesca

  def self.reaccion_pesca(jugador)
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

  def self.pescar_pez_randomYguardar(jugador)

    resultado = reaccion_pesca(jugador)

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

    jugador.peces << pez_pescado

  end

  def self.hay_cebo(jugador)
    cebo_existente = jugador.objetos.find do |obj|
      obj.tipo == "Cebo" && obj.stock > 0
    end

    if cebo_existente
      cebo_existente.stock -= 1

      if cebo_existente.stock <= 0
      jugador.objetos.delete(cebo_existente)
      end

      return true

    else
      puts "No tenes ningún cebo... No te conviene comprar?"
      return false
    end
  end

  def self.pescar(jugador)
    return unless hay_cebo(jugador)
    
    esperar()

    puts "AGARRASTE ALGO, PRESIONA ENTER RÁPIDO"

    pescar_pez_randomYguardar(jugador)
  end

end