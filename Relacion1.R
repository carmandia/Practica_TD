# Relacion 1 ----

# Problema 1 ----

source("teoriadecision_funciones_incertidumbre.R")
tb01 = crea.tablaX(c(5,4,6,
                     2,3,1,
                     -1,8,7,
                     5,2,0),numalternativas = 4,numestados = 3)
tb01
s01_Wald=criterio.Wald(tb01,favorable = T)
s01_Wald

criterio.Laplace(tb01,favorable = T)
criterio.Savage(tb01,favorable = T)
criterio.PuntoIdeal(tb01,favorable = T)

dibuja.criterio.Hurwicz(tb01,T)
dibuja.criterio.Hurwicz_Intervalos(tb01,T)
debug(dibuja.criterio.Hurwicz_Intervalos)

# Problema 3----

tab3=crea.tablaX(c(24,19,10,16,
                   22,22,23,20,
                   23,23,21,15,
                   25,24,18,14),numalternativas = 4,numestados = 4)
criterio.Todos(tab3,alfa = 0.5,favorable = T)


# Problema 7----
# `r y calculo q queremos que haga` asi sale en el texto directamente
# Ap A: criterio Wald
# Ap B: criterio Savage

# Problema 8----
# publicar en d1 salvo optimista que es d2


# bucles for caen en el examen a menudo, junto con poner valores generados automaticamnte y 
# hacerle un analisis



