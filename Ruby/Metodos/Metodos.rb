def Sumar(x, y)
    resultado = x + y
    puts "El resultado de la suma es: #{resultado}"
end

def Restar(x, y)
    resultado = x - y
    puts "El resultado de la resta es: #{resultado}"
end

def Dividir(x, y)
    resultado = x / y
    puts "El resultado de la división es: #{resultado}"
end

def PorcentajeX(x, y)
    resultado = (x * y) / 100.0
    puts "El #{y}% de #{x} es #{resultado}"
end

def saludar(nombre_usuario)
    puts "Bienvenido #{nombre_usuario}! Vamo a programa en ruby, así que prepara las neuronas"
end

def pedir_continuar
    puts ""
    puts "Bueno, ¿querés continuar? (Y/N)"
    respuesta = gets.chomp.upcase

    while respuesta != "Y" && respuesta != "N"
        puts "Solo es posible ingresar una opción válida que es Y o N, volvé a intentar por favor:"
        respuesta = gets.chomp.upcase
    end

    # El método devuelve 'true' si es "Y", o 'false' si es "N"
    respuesta == "Y"

    limpiar_pantalla()
end

def limpiar_pantalla
    system("clear") || system("cls")
end
