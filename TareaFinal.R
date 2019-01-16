library("rvest")
install.packages('rvest')
library('rvest')

#iniciando extracción de información
library('rvest')

#######Extracción de titulo#######

#inicializando la variable archivo con el nombre de mi página
archivo <-'tarea5.html'

#Leyendo el html de la página
webpage <- read_html (archivo)

html_nodes(webpage,"groucho")

#Extrayendo contenido en la clase aviso
contenedor_titulo <-html_nodes(webpage,"u")

#Pasando el titulo a texto
titulo <- html_text(contenedor_titulo)
print (titulo)

#Limpiar titulo
titulo <- gsub("Ã³","ó",titulo)
titulo <- gsub("Ã¡","á",titulo)


#Separando las palabras por espacio
splitEspaciotitulo <- strsplit(titulo," ")[[1]]
print (splitEspaciotitulo)

#Almacer el titulo en una lista
unlisttitulo <- unlist (splitEspaciotitulo)
unlisttitulo
tablatitulo <-table(unlisttitulo)

#Pasando la info a un data frame
dfPalabrastitulo <- as.data.frame(tablatitulo)
dfPalabrastitulo

#Almacenamiento del titulo en CVS
write.csv(dfPalabrastitulo, file="Palabrastitulo.cvs")

####### Extracción de la noticia

#inicializando la variable archivo con el nombre de mi página
archivo <-'tarea5.html'

#Leyendo el html del archivo
webpage <- read_html (archivo)

#Extrayendo contenido en la clase justificado
contenidoWebNoticia <-html_nodes(webpage,'p')

#pasando la info a texto
textoNoticia <- html_text(contenidoWebNoticia)

#Viendo a priori la info en la variable noticia
print(textoNoticia)


#eliminando los /n, comillas ("), puntos (.) y comas (,) del texto
textoNoticia <- gsub("\n","",textoNoticia)
textoNoticia <- gsub("\t","",textoNoticia)
print(textoNoticia)
textoNoticia <- gsub("\r","",textoNoticia)
print(textoNoticia)
textoNoticia <- gsub("Ã³","ó",textoNoticia)
print(textoNoticia)
textoNoticia <- gsub("Ã©","é",textoNoticia)
textoNoticia <- gsub("â\u0080\u009c","",textoNoticia)
textoNoticia <- gsub("â\u0080\u009d","",textoNoticia)
textoNoticia <- gsub("Ã","í",textoNoticia)
textoNoticia <- gsub("í¡","á",textoNoticia)
textoNoticia <- gsub("[.]","",textoNoticia)
textoNoticia <- gsub("[,]","",textoNoticia)

#viendo a priori la info en la variable textoNoticia
print(textoNoticia)

#separando las palabras con espacio
splitEspacioNoticia <- strsplit (textoNoticia," ") [[1]]

#Pasando todas las palabras a minúsculas
splitEspacioNoticia <- tolower(splitEspacioNoticia)

#contando palabras
unlistNoticias <-unlist(splitEspacioNoticia)
tablaPalabras <- table(unlistNoticias)

#pasando información a unda data frame
dfPalabrasNoticia <- as.data.frame(tablaPalabras)

#Almacenando la información en csv
write.csv(dfPalabrasNoticia, file="PalabrasNoticia.csv")

#o en un txt
write.table(dfPalabrasNoticia, file="PalabrasNoticias.txt")

###### Extracción información tabla, buscar en wikipedia tf-IDF

#Extrayendo el contenido de la tabla a través del tag table
tablaProductosExtraida <- html_nodes(webpage, '.Productos')

#se convieve aplicar aqui los gsub para limpiar la tabla

#Extracción de el contenido de las tablas usando el tag table
contenedorDeTablas <- html_nodes(tablaProductosExtraida, 'table')

#Extracción información tabla 1
tabla1 <- html_table(contenedorDeTablas [1][[1]])

#ver el contenido de la tabla de la posición 1,3 de la tabla 1
print(tabla1[1,3])

#Extracción información tabla 2
tabla2 <-html_table(contenedorDeTablas[2][[1]])

#Ver contenido en la posición 2,3 de la tabla 2 
print(tabla2[2,3])

#Ver el contenedor de tablas
print(contenedorDeTablas)
tabla1
tabla2

#Combinando los dos data frame y creando un tercer data frame
tablamerge <- rbind(tabla1,tabla2)

#Instalar paquete para hacer gráficos
install.packages('ggplot2')

#graficando los productos
library(ggplot2)

#grafico de barra
tabla1 %>%
  ggplot() +
  aes(x=Nombre, y=Precio) +
  geom_bar(stat="identity")
tabla1
tabla2

#grafico boxplot
tabla1 %>%
  ggplot() +
  geom_boxplot(aes(x=Nombre, y=Precio)) +
  theme_bw()












