include make.global

all : www/index.html

www/index.html : descriptive_index.Rmd
	Rscript -e 'OUT = "$@"; IN = "$<"; source("$(RMD2HTML)")'
