include make.global

WWW=www/descriptiva_CAT.html www/descriptiva_GIR.html www/descriptiva_ratios_gir.html

DATA=$(BASE)/dadescat.RData $(BASE)/dadesgir.RData

all: $(DATA) $(WWW) $(BASE)/finished

$(BASE)/dadescat.RData : $(BASE)/tractament_dades_cat.R
	Rscript $<
	
$(BASE)/dadesgir.RData : $(BASE)/tractament_dades_gir.R
	Rscript $<

www/descriptiva_CAT.html : $(BASE)/descriptiva_CAT.html $(BASE)/dadescat.RData
	Rscript -e 'OUT = "$@"; IN = "$<"; source("$(RMD2HTML)")' 

www/descriptiva_GIR.html : $(BASE)/descriptiva_GIR.html $(BASE)/dadesgir.RData
	Rscript -e 'OUT = "$@"; IN = "$<"; source("$(RMD2HTML)")' 

www/descriptiva_ratios_gir.html : $(BASE)/descriptiva_ratios_gir.html $(BASE)/dadesgir.RData
	Rscript -e 'OUT = "$@"; IN = "$<"; source("$(RMD2HTML)")' 
	
$(BASE)/finished : $(DATA) $(WWW)
	date > $@
