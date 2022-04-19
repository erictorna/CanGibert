library(readxl)
library(ggpubr)
library(dplyr)

Girona <- read_excel("~idiap/data/ABS_CanGibert_MartaFigueras_Odontologia/GIRONA/BD final/dades_girona.xlsx")

gir <- Girona[complete.cases(Girona),]

save(gir, file = '~idiap/projects/dadesRuth/dadesgir.RData')