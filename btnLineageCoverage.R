files <- list.files(path="/Users/singhal/Desktop/coverage/btn/",full.names=T)
cr <- matrix(NA,nrow=4,ncol=2)
coverage <- matrix(NA,nrow=20,ncol=3)
for (i in 1:length(files)) {
	file <- files[i]
	
	d <- read.table(file,header=F)
	
	#need to identify number of homologs at different depths
	covers <-c(10,20,30,40,50)
	for (j in 1:length(covers)) {
		c <- covers[j]
		num <- length(d[d$V2 > c & d$V3 > c & d$V4 > c & d$V5 > c & d$V6 > c & d$V7 > c & d$V8 > c & d$V9 > c & d$V10 > c & d$V11,]$V1)
		coverage[j+length(covers)*(i-1),1] <- file
		coverage[j+length(covers)*(i-1),2] <- c
		coverage[j+length(covers)*(i-1),3] <- num
		}
	
	correlation <- 0 
	compare <- 0
	#need to identify strength of corelation
	for (k in 2:6) {
		for (l in 7:11) {
			a <- cor(d[,k],d[,l],use="complete.obs")
			correlation <- correlation + a
			compare <- compare + 1
			}
		}
	correlation <- correlation/compare
	cr[i,1] <- file
	cr[i,2] <- correlation
	}
write.table(cr,"/Users/singhal/Desktop/coverage/betweenLineageCoverageCorrelation.out",sep="\t",row.names=F,col.names=F)
write.table(coverage,"/Users/singhal/Desktop/coverage/betweenLineageCoverage.out",sep="\t",row.names=F,col.names=F)