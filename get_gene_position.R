#!/usr/bin/Rscript
suppressMessages(library(biomaRt))
suppressMessages(library(optparse))

options<-OptionParser()

options<-add_option(options,
                    opt_str = c('-g','--genes'),
                    action = 'store',
                    type = 'character',
                    help = "Official genesymbol list"
)

options<-add_option(options,
                    opt_str = c('-o','--output'),
                    action = 'store',
                    type = 'character',
                    help = 'Output file name'
                    )

options<-parse_args(options)

genes<-read.table(file=options$genes,header = F)
#genes<-list(genes[,1])
genes<-genes[,1]

#ensembl <- useMart("ENSEMBL_MART_ENSEMBL")
grch37<-useMart(biomart = 'ENSEMBL_MART_ENSEMBL',host="grch37.ensembl.org",
                dataset = "hsapiens_gene_ensembl",
		path="/biomart/martservice")

#ensembl <- useDataset("hsapiens_gene_ensembl",mart=ensembl)

# filters value:
	# hgnc_symbol
	# ensembl_gene_id
	# entrezgene

genes_position<-getBM(attributes=c('chromosome_name', 'start_position', 'end_position', 'hgnc_symbol', 'strand'),
	      filters=c('hgnc_symbol'),
	      values=genes,
	      mart=grch37)
chr<-rep("chr",length(genes_position[,1]))
# concrete chr and chr number
chr<-paste0(chr,genes_position$chromosome_name)
genes_position$chromosome_name<-chr
# insert bed score column
score=rep(".",length(genes_position[,1]))
# strand 
for (i in 1:length(genes_position$strand)){
if (genes_position$strand[i] == 1){
	genes_position$strand[i] <- "+"
	}
else if (genes_position$strand[i] == -1){
	genes_position$strand[i] <- "-"
	}
	}
genes_position$score<-score
genes_position<-genes_position[,c(1,2,3,4,6,5)]

write.table(genes_position,file = options$output,sep="\t",row.names=F,col.names=T,quote=F)





