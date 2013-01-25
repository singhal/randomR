library(ggplot2)
library(plyr)
d <- read.table("/Users/singhal/Desktop/genomics/homology/homologyComparison.out",header=F)
names(d) <- c("type","contig","contact","contactType","gene","align","perAlign","diff","gap")
d <- d[d$perAlign <= 1,]

pdf("homologyComparison.pdf")
a  <- split(d, d$gene)
for (i in 1:length(a)) {
	tmp <- a[[i]]
	for (j in 6:9) {
		p <- ggplot(tmp,aes(tmp$type,tmp[,j]))
		p <- p + geom_boxplot(aes(fill=factor(contactType)),outlier.shape=NA)+xlab("homology method")+ylab(paste(names(d)[j]))+opts(title=(paste(names(a)[i])))+scale_fill_discrete("contact type")
		print(p)
		}	
	}
dev.off()	


d <- read.table("/Users/singhal/Desktop/genomics/homologyComparison.out",header=F)
names(d) <- c("type","contig","contact","contactType","gene","align","perAlign","diff","gap")
d <- d[d$perAlign > 0.75,]
ggplot(d,aes(type,fill=contactType))+geom_bar(position="dodge")+facet_grid(.~gene)
