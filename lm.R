data(iris)
names(iris)
attach(iris)
iris$Sepal.Length
recuento.especie = table(iris$Species)
# Generacion de un vector
vec <- c(1,1,1,0,0,3,3,3,3,2)
table(vec)
length(vec)
table(vec)/length(vec)
table(prop.table(vec))
mean(vec)
summary(iris)
moda <- function(datos){
  frecuencia.datos <- table(datos)
  maximo = which(frecuencia.datos == max(frecuencia.datos))
  names(maximo)
}

moda(vec)

# funcion de resumen
tapply(iris$Petal.Length, iris$Species, summary)
tapply(iris$Petal.Width, iris$Species, summary)
tapply(iris$Sepal.Length, iris$Species, summary)
tapply(iris$Sepal.Width, iris$Species, summary)

# Medidas estadisticas
mean(iris$Petal.Length)
median(iris$Petal.Length)
moda(iris$Petal.Length)
max(iris$Petal.Length)
min(iris$Petal.Length)
var(iris$Petal.Length)
sd(iris$Petal.Length)
quantile(iris$Petal.Length, 0.2)
quantile(iris$Petal.Length, seq(0, 1, 0.25))
quantile(iris$Petal.Length, seq(0, 1, 0.1))
vec[1]

# Correlacion lineal
cor(iris[,1:4])

# Primera forma
lsfit(iris$Petal.Length, iris$Petal.Width)$coefficients
plot(iris$Petal.Length, iris$Petal.Width, pch = 21, bg=c('red', 'green', 'blue')[unclass(iris$Species)],
     main='Analisis de regresion iris', xlab = 'Longitud de petalo', ylab= 'Ancho de petalo')
abline(lsfit(iris$Petal.Length, iris$Petal.Width)$coefficients, col='black')

# segunda forma

modelo2 = lm(Petal.Width ~ Petal.Length, data = iris)$coefficients
plot(iris$Petal.Length, iris$Petal.Width, pch = 21, bg=c('red', 'green', 'blue')[unclass(iris$Species)],
     main='Analisis de regresion iris', 
     xlab = 'Longitud de petalo', 
     ylab= 'Ancho de petalo')
abline(modelo2, col = 'black')

#Mas datos
summary(modelo2)

#coeficientes
lm(Petal.Width ~ Petal.Length, data = iris[which(iris$Species=="setosa"),])$coefficients
lm(Petal.Width ~ Petal.Length, data = iris[which(iris$Species=="versicolor"),])$coefficients
lm(Petal.Width ~ Petal.Length, data = iris[which(iris$Species=="virginica"),])$coefficients

lm(Sepal.Length ~ Sepal.Width:Species + Species-1, data=iris)$coefficients
lm(Petal.Width ~ Petal.Length:Species + Species-1, data=iris)$coefficients

summary(lm(Petal.Width ~ Petal.Length:Species + Species -1, data = iris)$coefficients)

summary(step(lm(Petal.Width ~ Petal.Length*Species,data=iris)))

