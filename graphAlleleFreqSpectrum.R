dir <- "/Users/singhal/Desktop/genomics/snpDiscovery/"

cov <- c(5,10,30,50)
af <- c(2,2,3,5)
graphs <- list()

for (i in 1:length(cov)) {
	tmp <- paste(dir,"alleleFreqSpectrum_cov", cov[i], "_af", af[i], ".out", sep="")
	a <- read.table(tmp,header=F)
	graphs[[i]] <- qplot(V1,data=a,geom="histogram",binwidth=0.05)+xlab("minor allele frequency")+opts(title=paste("coverage of ",cov[i],sep=""))
	}
multiplot(graphs[[1]],graphs[[2]],graphs[[3]],graphs[[4]],cols=4)	
