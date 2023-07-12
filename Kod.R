##Wczytanie i instalacja podstawowych pakietów
library(ggplot2)
library(dplyr)
install.packages('psych')
library(psych)
##Wczytanie danych oraz ich przetwarzanie:
library(readxl)
DaneEU <- read_excel("Data/DaneEU.xlsx")

DaneEU$nazwa_kraju<-rownames(DaneEU$Kraj)

##usuniecie kolumny Kraj oraz import
DaneEU_analiza <-DaneEU %>% select(-Kraj, -import)

##Podsumowanie podstawowych statystyk opisowych

summary(DaneEU_analiza)

##Niektore dane powinny byc zapisane w procentach, w analizie PCA oraz w algorytmach grupowania jest to obojetne -
## dane i tak beda zeskalowane 
##Przed skalowaniem danych sprawdzono rozkłady zmiennych

for(zmienna in colnames(DaneEU_analiza)){
  
  rezultat<-shapiro.test(DaneEU_analiza[[zmienna]])
  
}

rezultat


##Podsumowanie danych:
