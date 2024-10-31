install.packages("formattable")
install.packages("webshot")
webshot::install_phantomjs()
install.packages("devtools")
install.packages("kableExtra")
# Si hay problemas con kableExtra instalarlo con el siguiente comando
# devtools::install_github("kupietz/kableExtra")
install.packages("factoextra")
install.packages("diagram")
install.packages("qgraph")
devtools::install_github("calote/ahp")

# Problema 1----
source("teoriadecision_funciones_multicriterio.R")
source("teoriadecision_funciones_multicriterio_diagram.R")
library(ahp)
# Ejercicio 1----

# Ap 1----
tabla1a=multicriterio.crea.matrizvaloraciones(c(1,0,1,
                                            1,1,1,
                                            0,0,1),numalternativas = 3)
tabla1a
sol1a=multicriterio.constfuncutilidad.maximales(tabla1a)
sol1a
# Ap 2----
(tabla1b=multicriterio.crea.matrizvaloraciones(c(1,0,1,
                                                1,1,1,
                                                1,0,1),numalternativas = 3))
(sol1b=multicriterio.constfuncutilidad.maximales(tabla1b))
sort(sol1b,T)

(sol1b=multicriterio.constfuncutilidad.estructuraborrosa(tabla1b))
sort(sol1b,T)

#Ap 3----
tab1c=multicriterio.crea.matrizvaloraciones(rep(1,9),3)
tab1c
sol1c=multicriterio.constfuncutilidad.maximales(tab1c)
sol1c

#Ap 4----
tab1d=multicriterio.crea.matrizvaloraciones(c(1,1,1,0,1,
                                              0,1,0,0,1,
                                              1,0,1,0,1,
                                              1,1,1,1,0,
                                              0,0,0,0,1),numalternativas = 5)
tab1d
sol1d=multicriterio.constfuncutilidad.maximales(tab1d)
sol1d
sol1d=multicriterio.constfuncutilidad.estructuraborrosa(tab1d)
sol1d

# Ejercicio 2----

tabla2a=multicriterio.crea.matrizvaloraciones(c(0,0.4,0.7,
                                                0.2,0,0.5,
                                                0.3,0.6,0),numalternativas = 3)
tabla2a
sol2a=multicriterio.constfuncutilidad.estructuraborrosa(tabla2a)
sol2a

# Ejercicio 3----
tabla3=multicriterio.crea.matrizdecision(c(100,15,7,40,50,
                                           200,25,7,60,200,
                                           100,20,4,25,25,
                                           200,30,20,70,350,
                                           250,25,25,100,500),numalternativas = 5,numcriterios = 5)
multicriterio.homogeneizacion.nadir(tabla3)


# Ejercicio 4----

# Usando ahp
datos24=Load("ejmultinivel.ahp")
Calulate(datos24)
Visualize(datos24)
AnalyzeTable(datos24)# contribucion total
AnalyzeTable(datos24,variable = "priority")# pesos locales


# Creando nosotros
library(ahp)
datos=Load("datos24.ahp")
Calculate(datos)
Visualize(datos)
AnalyzeTable(datos) # pesos globales
AnalyzeTable(datos,variable = "priority") # pesos locales. Por defecto usa el metodo de los autovalores

source("teoriadecision_funciones_multicriterio.R")
source("teoriadecision_funciones_multicriterio_diagram.R")
tablan01= multicriterio.crea.matrizvaloraciones_mej(c(2),numalternativas = 2)
tablan02a=multicriterio.crea.matrizvaloraciones_mej(c(3),numalternativas = 2)
tablan02b=multicriterio.crea.matrizvaloraciones_mej(c(1/2),numalternativas = 2)
pesn01= multicriterio.metodoAHP.variante1.autovectormayorautovalor(tablan01)
pesn02a=multicriterio.metodoAHP.variante1.autovectormayorautovalor(tablan02a)
pesn02b=multicriterio.metodoAHP.variante1.autovectormayorautovalor(tablan02b)
multicriterio.metodoAHP.pesosglobales_entabla(pesn01$valoraciones.ahp,
          rbind(pesn02a$valoraciones.ahp,
                pesn02b$valoraciones.ahp)  )
# asi solo cuando es un arbol de 2 niveles
multicriterio.metodoahp.diagrama(Xmatriznivel1 = )

Xmatriznivel2 = array(NA,dim=c(2,2,2))
Xmatriznivel2[,,1] =tablan02a
Xmatriznivel2[,,2] =tablan02b

multicriterio.metodoahp.diagrama(tablan01,Xmatriznivel2)


peson01=multicriterio.metodoAHP.variante2.mediageometrica(tablan01)


## Ejercicio 7----

source("teoriadecision_funciones_multicriterio.R")
p7 = multicriterio.crea.matrizdecision(c(100,15,7,40,-50,
                                         200,25,7,60,-200,
                                         100,20,4,25,-25,
                                         200,30,20,70,-350,
                                         250,25,15,100,-500),
                                       numalternativas = 5,
                                       numcriterios = 5)
(s7p1=multicriterio.metodoELECTRE_I(p7,pesos.criterios = c(0.25,0.25,0.2,0.2,0.2),
                              nivel.concordancia.minimo.alpha = 0.7,
                              no.se.compensan = c(60,Inf,4,Inf,Inf),
                              que.alternativas = T))


s7p1$relacion.dominante


qgraph::qgraph(s7p1$relacion.dominante)
s7p1$nucleo_aprox

(s7p2=multicriterio.metodoELECTRE_I(p7,pesos.criterios = c(0.25,0.25,0.2,0.2,0.2),
                                    nivel.concordancia.minimo.alpha = 0.7,
                                    no.se.compensan = c(60,Inf,4,Inf,Inf),
                                    que.alternativas = c(4,5)))

qgraph::qgraph(s7p2$relacion.dominante)
s7p2$nucleo_aprox


(s7p3=multicriterio.metodoELECTRE_I(p7,pesos.criterios = c(0.25,0.25,0.2,0.2,0.2),
                                    nivel.concordancia.minimo.alpha = 0.55,
                                    no.se.compensan = c(60,Inf,4,Inf,Inf),
                                    que.alternativas = c(4,5)))

qgraph::qgraph(s7p3$relacion.dominante)
s7p3$nucleo_aprox

