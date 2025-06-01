# SERIE DE FIBICCINI

# Se le pide al usario ingresar un número con el fin de que ese sea el número de sucesiones dentro de la serie
n = int(input("\nDigite el número de sucesiones que quieres que tenga esta serie: "))

# Se les da valor a las variables iniciales
a = 0
b = 1
c = 0

# Acá se calcula la serie de Fibonachi hasta el número digitado por el usuario:
print(" ")
print(f"La serie se Fibonacci hasta la sucesión {n} es:")
for i in range(0, n):
    c = a + b
    print(f"{c}", end=" ")
    a=b
    b=c


# CONJETURA DE COLLATZ

# Se le pide al usario ingresar un número con el fin de que ese sea el número de sucesiones dentro de la serie
num = int(input("\nIngrese un número enetero positivo: "))

# Aplica la conjetura de Collatz y cuenta las operaciones
operaciones = 0
n = num
while n != 1:
    if n % 2 == 0:
        n = n // 2
    else:
        n = 3 * n + 1
    operaciones += 1

# Imprime el resultado
print(f"Para el número {num}, se deben realizar {operaciones} operaciones de Collatz para alcanzar el primer número 1.")