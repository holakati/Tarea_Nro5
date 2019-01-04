library("rvest")
install.packages('rvest')
library('rvest')

#iniciando extracción de información
library('rvest')

#inicializando la variable archivo con el nombre de mi página
archivo <-'tarea5.html'

#Leyendo el html del archivo
webpage <-read_html (archivo)

#Extrayendo contenido en la clase justificado
contenidoWebNoticia <-html_nodes(webpage,'p')

#pasando la info a texto
textoNoticia <- html_text(contenidoWebNoticia)

#Viendo a priori la info en la variable noticia
print(textoNoticia)

#pregunta: ¿Qué representa al /n?

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
