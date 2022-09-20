# Paso 1: Identificar las variables básicas
# x1 = Cantidad de yogurts a producirse 
# x2 = Cantidad de jugos a producirse 


# Paso 2: Identificar las variables "cj"
# c1 = $ 20 / yogur  
# c2 = $ 25 / jugos 
# c3 = $25(1.5kg/botella+1.8kg/botella) 
# c4 = $20(1.2kg/botella+1.1kg/botella) 


# Paso 3: Función objetivo
# Max z = (20/ yogur) + ($ 25 / jugos)-$25(1.5kg/botella+1.8kg/botella)-$20(1.2kg/botella+1.1kg/botella)
# Max z = 20x1 + 25x2 - 25(1.5x1 + 1.8x2) – 20(1.2x1 + 1.1x2)
#Simplificación 
# 20x1 + 25x2 – 37.5x1- 45x2 – 24x1 – 22x2
# Max z = -41.5x1 – 42x2

# Paso 4: Identificar "bj"
# b1 = Capacidad máxima de yogur y jugos de fresa producir kg (4500)
# b2 = Capacidad máxima de yogurt y fresa de durazno a producir (6300)
# b3 = cantidad máxima de botellas para los productos (60,00 y 90,000)

# Paso 5: Identificar "aij"
# b3 = cantidad máxima de botellas para yogurt (60,000)
# b4 = cantidad máxima de botellas para jugos (90,000)


# Paso 6: Armar restricciones
# b1 = Capacidad máxima de yogur y jugos de fresa producir kg (4500)
# (1.5kg/botella) + (1.8kg/botella)
# 1.5x1 + 1.8x2 <= 4500

# b2 = Capacidad máxima de yogurt y fresa de durazno a producir (6300)
# (1.2kg/botella) + (1.1kg/botella)
#1.2x1 + 1.1x2 <= 6300

# b3 = cantidad máxima de botellas para yogurt (60,000)
# x1 <= 60000

#b4 = cantidad máxima de botellas para jugos (90,000)
# x2 <= 90000


# Paso 7: No negatividad
# x1, x2 >= 0


# Paso 8: Modelo general
# Max z = -41.5x1 – 42x2
# s.a.
# 1.5x1 + 1.8x2 <= 4500
#1.2x1 + 1.1x2 <= 6300
# x1 <= 60000
# x2 <= 90000
# x1, x2 >= 0

library(lpSolve)


# Se guardan en una matriz los coeficientes de la funci?n objetivo
funcion_objetivo <- c(20, 25)
funcion_objetivo
# Asignar los coeficientes de las desigualdades
# 1.5x1  +  1.8x2 <= 4500    1.5  1.8  (1)
# 1.2x1  +  1.1x2 <= 6300    1.2  1.1  (2)
# x1              <= 60000    1    0   (3)        
#           x2    <= 90000    0    1   (4)
# Definir el n?mero de filas en 3
restriciones_derecho <- matrix(c(1.5,1.8,1.2,1.1,1,0,0,1), nrow = 4 , byrow = T)
restriciones_derecho

# Se guarda en una matriz los simbolos de las desigualdades
restriccion.direccion <- c("<=", "<=", "<=", "<=")
restriccion.direccion

# Asignar los valores del lado derecho de las desiguldades
# 1.5x1  +  1.8x2 <= 4500      4500    (1)
# 1.2x1  +  1.1x2 <= 6300      6300    (2)
# x1              <= 60000     60000   (3)        
#           x2    <= 90000     90000   (4)

lado_derecho.restriccion <- c(4500, 6300, 60000, 90000)

# Se ejecuta la instrucci?n para mostrar los valores de x1 y x2
lado_derecho.restriccion

## Se ejecuta la instrucci?n para mostrar el resultado que maximize la funci?n
lp(direction = "max", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)

# Se ejecuta la instrucci?n para mostrar los valores de x1 y x2.
lp(direction = "max", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)$solution
