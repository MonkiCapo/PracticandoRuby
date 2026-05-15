require_relative 'MetodosCalc/Metodos.rb'

puts "Por favor, ingresá tu nombre:"
nombre_ingresado = gets.chomp

while nombre_ingresado.empty?
    puts "No ingresaste ningún nombre. Aún así, prepara las neuronas y colocalo!"
    nombre_ingresado = gets.chomp
end

saludar(nombre_ingresado)

puts ""

loop do

    puts "Seleccioná una operación:"
    puts "1. Sumar"
    puts "2. Restar"
    puts "3. Dividir"
    puts "4. Sacar porcentaje de un valor"
    puts "5. Si no te gusta la calcu, usa esta opción"

    opcion = gets.chomp

    case opcion
    when "1"
        puts "--- Has elegido Sumar ---"
        puts "Ingresá el primer número:"
        n1 = gets.chomp.to_i  # .to_i convierte el texto directamente a número entero / .to_f si queremos el resultado en decimal
        puts "Ingresá el segundo número:"
        n2 = gets.chomp.to_i
        Sumar(n1, n2)
        break unless pedir_continuar

    when "2"
       puts "--- Has elegido Restar ---"
        puts "Ingresá el primer número:"
        n1 = gets.chomp.to_i
        puts "Ingresá el segundo número:"
        n2 = gets.chomp.to_i
        Restar(n1, n2)
        break unless pedir_continuar

    when "3"
        puts "--- Has elegido Dividir ---"
        puts "Ingresá el primer número:"
        n1 = gets.chomp.to_f
        puts "Ingresá el segundo número:"
        n2 = gets.chomp.to_f
        Dividir(n1, n2)
        break unless pedir_continuar

    when "4"
        puts  "--- Has elegido Sacar el porcentaje de un valor ---"
        puts "Ingresá el primer número:"
        n1 = gets.chomp.to_f
        puts "Ingresá el porcentaje a descontar:"
        n2 = gets.chomp.to_f
        PorcentajeX(n1, n2)
        break unless pedir_continuar

    when "5"
        puts "Si no te interesa la calculadora, espera nomás que capaz y agrego algo que te guste #{nombre_ingresado} :)"
        break

    else
        puts "No se supone que tenes que usar uno de los números de la lista? Intentemos de nuevo"
        puts ""
        puts "Claro, solo si queres (Y para continuar / N para salir)"

        respuesta = ""

        while respuesta != "Y" && respuesta != "N"
            puts "Solo es posible ingresar una opción válida que es Y o N, volve a intentar porfavor"
            respuesta = gets.chomp.upcase
        end

        if respuesta == "N"
            puts "Un gusto entonces, #{nombre_ingresado}, aun así esperate que seguro agregue otra cosa por aca así seguis testeando"
            break
        end
    end
end