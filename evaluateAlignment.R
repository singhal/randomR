library(ggplot2)
d <- read.table("/Users/singhal/Desktop/genomics/alignStats/alignEvaluation.out",header=T)

pdf("/Users/singhal/Desktop/genomics/alignStats/alignEvaluation.pdf")
p <- ggplot(d,aes(factor(id),reads))
P<-p+geom_boxplot()+xlab("alignment program")
print(P)
p <- ggplot(d,aes(factor(id),pairs))
P<-p+geom_boxplot()+xlab("alignment program")
print(P)
p <- ggplot(d,aes(factor(id),time))
P<-p+geom_boxplot()+xlab("alignment program")
print(P)
dev.off()

ids <- grep("afCorr",names(d))
afCorr <- c()
for (i in 1:length(ids)) {
	tmp <- d[,ids[i]]
	afCorr <- c(afCorr,tmp)
	}
mean(afCorr,na.rm=T)	


ids <- grep("uniqSnp",names(d))
uniqSnp <- c()
for (i in 1:length(ids)) {
	tmp <- d[,ids[i]]
	uniqSnp <- c(uniqSnp,tmp)
	}
mean(uniqSnp,na.rm=T)	


ids <- grep("uniqIndel",names(d))
uniqIndel <- c()
for (i in 1:length(ids)) {
	tmp <- d[,ids[i]]
	uniqIndel <- c(uniqIndel,tmp)
	}
mean(uniqIndel,na.rm=T)	


ids <- grep("covCorr",names(d))
covCorr <- c()
for (i in 1:length(ids)) {
	tmp <- d[,ids[i]]
	covCorr <- c(covCorr,tmp)
	}
mean(covCorr,na.rm=T)	


