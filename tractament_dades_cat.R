library(readxl)
library(ggpubr)
library(dplyr)

poblacional <- read_excel("~idiap/data/ABS_CanGibert_MartaFigueras_Odontologia/Catalunya/dades_poblacionals.xlsx")
salutotal <- read_excel("~idiap/data/ABS_CanGibert_MartaFigueras_Odontologia/Catalunya/salut_oral.xlsx")
accessibilitat <- read_excel("~idiap/data/ABS_CanGibert_MartaFigueras_Odontologia/Catalunya/accessibilitat.xlsx")
correlacio <- read_excel("~idiap/data/ABS_CanGibert_MartaFigueras_Odontologia/Catalunya/dades_correlacio.xlsx")

pob <- poblacional[complete.cases(poblacional),]
salut <- salutotal[complete.cases(salutotal),]
acces <- accessibilitat[complete.cases(accessibilitat),]
acces[acces == 'no'] <- NA

cat <- left_join(pob, salut)
cat <- left_join(cat, acces)

corr <- correlacio[complete.cases(correlacio),]
corr[corr=='no']<-NA
save(cat, file = '~idiap/projects/dadesRuth/dadescat.RData')
save(corr, file = '~idiap/projects/dadesRuth/corrcat.RData')