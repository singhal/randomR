library(ggplot2)
d <- read.table("/Users/singhal/Desktop/genomics/assemblyEvaluation.out",header=T)
pdf("/Users/singhal/Desktop/assemblyEvaluation.pdf")
for (i in 3:length(d)) {
	tmp <- data.frame(d$contact,d$assembly,d[,i])
	p <- ggplot(tmp,aes(factor(tmp[,2]),tmp[,3]))+geom_boxplot(aes(fill = factor(tmp[,2])))+xlab("assembly")+ylab(paste(names(d)[i]))+scale_fill_discrete("")
	print(p)
	}
p <- ggplot(d,aes(factor(d$assembly),d$anno*d$totContigs))+geom_boxplot(aes(fill = factor(tmp[,2])))+xlab("assembly")+ylab("number annotated")+scale_fill_discrete("")
print(p)
dev.off()	