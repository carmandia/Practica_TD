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
