#!/usr/bin/Rscript
suppressMessages(library(optparse))
suppressMessages(library(VennDiagram))
options=OptionParser()
options=add_option(options,
                   opt_str = c('-s','--sample'),
                   action = 'store',
                   type = 'integer',
                   help = 'Sample number for venn plot, an integer number' )
options=add_option(options,
                   opt_str = c('-l','--list'),
                   action = 'store',
                   type = 'character',
                   help = 'Sample list for plot,
                   seperated by comma')
options=add_option(options,
                   opt_str = c('-m','--main'),
                   action = 'store',
                   type = 'character',
                   default = 'Main',
                   help = 'Title for venn plot')
options=add_option(options,
                   opt_str = c('-n','--name'),
                   action = 'store',
                   type = 'character',
                   default = 'Venn',
                   help = 'Venn plot figure name')
options=add_option(options,
                   opt_str = c('-p','--labels'),
                   action = 'store',
                   type = 'character',
                   help = 'Labels for category')
options=parse_args(options)

## Two samples
if(options$sample == 2){
  sample_list=strsplit(options$list,split = ',')
  labels_list=strsplit(options$labels,split = ',')
  sample1=sample_list[[1]][1]
  sample2=sample_list[[1]][2]
  sample1=read.table(file=sample1,header = F)
  sample2=read.table(file=sample2,header = F)
  png(filename = options$name)
  venn.diagram(x = list(sample1[,1],sample2[,1]),
              category.names = c(labels_list[[1]][1],labels_list[[1]][2]),
              filename = options$name,
              fill=c('#E64B35FF','#4DBBD5FF'),
#              col=c('#E64B35FF','#4DBBD5FF'),
	      cat.cex=2,
              main.cex=3,cex=3,
              main.fontfamily = 'Arial',
              fontfamily='Arial',
              cat.fontfamily='Arial',
              main = options$main,
              cat.pos=c(0,0),
              margin=0.05,
              height = 3000,
              width = 3000,
              resolution = 300,
              units = 'px',
              imagetype = 'png',
	      scaled = F,
	      alpha=0.8)
  dev.off()
  q(save = 'no')
}

## Three samples
if(options$sample == 3){
  sample_list=strsplit(options$list,split = ',')
  labels_list=strsplit(options$labels,split = ',')
  sample1=sample_list[[1]][1]
  sample2=sample_list[[1]][2]
  sample3=sample_list[[1]][3]
  sample1=read.table(file=sample1,header = F)
  sample2=read.table(file=sample2,header = F)
  sample3=read.table(file=sample3,header = F)
  png(filename = options$name)
  venn.diagram(x = list(sample1[,1],sample2[,1],sample3[,1]),
               category.names = c(labels_list[[1]][1],labels_list[[1]][2],labels_list[[1]][3]),
               filename = options$name,
               fill=c('#E64B35FF','#4DBBD5FF','#00A087FF'),
 #              col=c('#E64B35FF','#4DBBD5FF','#00A087FF'),
               cat.cex=2,
               main.cex=3,cex=3,
               main.fontfamily = 'Arial',
               fontfamily='Arial',
               cat.fontfamily='Arial',
               main = options$main,
               cat.pos=c(0,0,180),
               margin=0.05,
               height = 3000,
               width = 3000,
               resolution = 300,
               units = 'px',
               imagetype = 'png',
	       alpha=0.8)
  dev.off()
  q(save = 'no')
}

## Four samples
if(options$sample ==4){
  sample_list=strsplit(options$list,split = ',')
  labels_list=strsplit(options$labels,split = ',')
  sample1=sample_list[[1]][1]
  sample2=sample_list[[1]][2]
  sample3=sample_list[[1]][3]
  sample4=sample_list[[1]][4]
  sample1=read.table(file=sample1,header = F)
  sample2=read.table(file=sample2,header = F)
  sample3=read.table(file=sample3,header = F)
  sample4=read.table(file=sample4,header = F)
  png(filename = options$name)
  venn.diagram(x = list(sample1[,1],sample2[,1],sample3[,1],sample4[,1]),
               category.names = c(labels_list[[1]][1],labels_list[[1]][2],labels_list[[1]][3],labels_list[[1]][4]),
               filename = options$name,
               fill=c('#E64B35FF','#4DBBD5FF','#00A087FF','#3C5488FF'),
  #             col=c('#E64B35FF','#4DBBD5FF','#00A087FF','#3C5488FF'),
               cat.cex=2,
               main.cex=3,cex=3,
               main.fontfamily = 'Arial',
               fontfamily='Arial',
               cat.fontfamily='Arial',
               main = options$main,
               cat.pos=c(0,0,0,0),
               margin=0.05,
               height = 3000,
               width = 3000,
               resolution = 300,
               units = 'px',
               imagetype = 'png',
	       alpha=0.8)
  dev.off()
  q(save = 'no')
}

## five samples
if(options$sample ==5){
  sample_list=strsplit(options$list,split = ',')
  labels_list=strsplit(options$labels,split = ',')
  sample1=sample_list[[1]][1]
  sample2=sample_list[[1]][2]
  sample3=sample_list[[1]][3]
  sample4=sample_list[[1]][4]
  sample5=sample_list[[1]][5]
  sample1=read.table(file=sample1,header = F)
  sample2=read.table(file=sample2,header = F)
  sample3=read.table(file=sample3,header = F)
  sample4=read.table(file=sample4,header = F)
  sample5=read.table(file=sample5,header = F)
  png(filename = options$name)
  venn.diagram(x = list(sample1[,1],sample2[,1],sample3[,1],sample4[,1],sample5[,1]),
               category.names = c(labels_list[[1]][1],labels_list[[1]][2],labels_list[[1]][3],labels_list[[1]][4],labels_list[[1]][5]),
               filename = options$name,
               fill = c("#E64B35FF", "#4DBBD5FF", "#00A087FF", "#3C5488FF", "#F39B7FFF"),
   #            col = c("#E64B35FF", "#4DBBD5FF", "#00A087FF", "#3C5488FF", "#F39B7FFF"),
               cat.cex=1.5,
               main.cex=3,
               cex = c(1.5, 1.5, 1.5, 1.5, 1.5, 1, 0.8, 1, 0.8, 1, 0.8, 1, 0.8,
                       1, 0.8, 1, 0.55, 1, 0.55, 1, 0.55, 1, 0.55, 1, 0.55, 1, 1, 1, 1, 1, 1.5),
               main.fontfamily = 'Arial',
               fontfamily='Arial',
               cat.fontfamily='Arial',
               main = options$main,
               #cat.pos=c(0,0,0,0,0),
               margin=0.05,
               height = 3000,
               width = 3000,
               resolution = 300,
               units = 'px',
               imagetype = 'png',
	       alpha=0.8)
  dev.off()
  q(save = 'no')
}
