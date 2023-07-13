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
DaneEU_analiza <-DaneEU %>% select(-Kraj, -import,-br,-ubostwo)

##Podsumowanie podstawowych statystyk opisowych

summary(DaneEU_analiza)

##Niektore dane powinny byc zapisane w procentach, w analizie PCA oraz w algorytmach grupowania jest to obojetne -
## dane i tak beda zeskalowane 
##Przed skalowaniem danych sprawdzono rozkłady zmiennych

for(zmienna in colnames(DaneEU_analiza)){
  
  rezultat<-shapiro.test(DaneEU_analiza[[zmienna]])
  if(rezultat$p.value>0.05){
    
    cat("Zmienna:", zmienna, "ma rozkład zbliżony do rozkładu normalnego \n")
    
    
  }
  else{
    
    cat("Zmienna:", zmienna, "nie ma rozkładu zbliżonego do rozkładu normalnego \n")
    
    
    
    
  }
  
}




##Podsumowanie danych:
##Wszystkie wybrane parametry mają rozkład zbliżony do r. normalnego


#Rozpoczęcie analizy - PCA
##utworzenie wektora PCA
wektor_pca<-principal(DaneEU_analiza,6)
wektor_pca$values
##Wartosci wlasne wskazuja na wybor dwoch skladowych

##nadpisanie obiektu wektor_pca - wybor dwoch skladowych


wektor_pca<-principal(DaneEU_analiza,2)

##sprawdzenie korelacji wymiarow z danymi wejsciowymi
biplot(wektor_pca)
wektor_pca$residual

