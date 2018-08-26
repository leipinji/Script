#!/usr/bin/Rscript
options=commandArgs(trailingOnly = T)
txt=options[1]
xlsx=options[2]
library(xlsx)
file=read.table(file=txt,header = T,sep = "\t",quote = "")
#col=colnames(file)
#col_len=length(col)
#col=c(col[c(1,2,3)],"%",col[5:col_len])
#colnames(file)=col
write.xlsx(file=xlsx,col.names = T,x = file,row.names=F)
