files <- list.files("/media/DataDrive/sutureGenomics/",recursive=T,pattern="preErrorChecking.out",full.names=T)
error <- matrix(0,length(files),5)
for (i in 1:length(files)) {
	file <- files[i]
	d <- read.table(files[i],header=F)
	totalign <- d[d$V1=="totalign",]$V3
	a <- d[d$V1=="ERR",]
	toterr <- sum(a$V3)
	gap_err <- sum(a[grep("-",a$V2),]$V3)
	n_err <- sum(a[grep("n",a$V2),]$V3)
	non_n_err <- toterr - n_err
	name <- sub("/preErrorChecking.out", "",file)
	name <- sub("/media/DataDrive/sutureGenomics/", "",name)
	error[i,1] <- name
	error[i,2] <- as.numeric(round(toterr/totalign, digits = 6))
	error[i,3] <- as.numeric(round(gap_err/totalign, digits = 6))
	error[i,4] <- as.numeric(round(n_err/totalign, digits = 6))
	error[i,5] <- as.numeric(round(non_n_err/totalign, digits = 6))
	}
write.table(error,file="preErrorProfile.out",row.names=F,col.names=F,sep="\t")
mean(as.numeric(error[,5]))
min(as.numeric(error[,5]))
max(as.numeric(error[,5]))
mean(as.numeric(error[,3]))
min(as.numeric(error[,3]))
max(as.numeric(error[,3]))