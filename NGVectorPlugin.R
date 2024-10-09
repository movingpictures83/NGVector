### R code from vignette source 'EBSeq_Vignette.Rnw'

###################################################
### code chunk number 1: EBSeq_Vignette.Rnw:172-173
###################################################
library(EBSeq)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
    pfix = prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }

}

run <- function() {}

output <- function(outputfile) {
IsoNames <- readLines(paste(pfix, parameters["isonames", 2], sep="/"))
IsoGeneNames <- readLines(paste(pfix, parameters["isogenenames", 2], sep="/"))

###################################################
### code chunk number 8: EBSeq_Vignette.Rnw:324-327
###################################################
NgList=GetNg(IsoNames, IsoGeneNames)
IsoNgTrun=NgList$IsoformNgTrun
IsoNgTrun[c(1:3,201:203,601:603)]
saveRDS(IsoNgTrun, outputfile)
}

