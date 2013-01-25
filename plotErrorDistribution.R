files <- list.files("/Users/singhal/Desktop/align/", pattern="errorDistrib", full.names=T)
#density
require(splines)
pdf("test.pdf")
for (i in 1:length(files)) {
	d <- read.table(files[i],header=F)
	names(d) <- c("type","relPos","number")
	d <- d[d$relPos !=0.05 & d$relPos !=0.15 & d$relPos !=0.25 & d$relPos !=0.35 & d$relPos !=0.45 & d$relPos !=0.55 & d$relPos !=0.65 & d$relPos !=0.75 & d$relPos !=0.85 & d$relPos !=0.95, ]
	ltys = c("dotted", "dashed",  "dotted",  "dotted",  "dotted", "dashed", "dashed",  "dotted",  "dotted",  "dotted", "dashed",  "dotted")
	plot.new()
	par(mar = c(6, 6, 1, 7),xpd=T);
	plot.window(xlim = c(0,1), ylim=c(0,0.035));
	axis(1)
	axis(2)
	mtext(side = 1, text = 'read pos', line=3.5)
	mtext(side = 2, text= 'mismatch density', line=3.5)
	types <- unique(d$type)
	for (k in 1:length(types)) {
		tmp <- d[d$type==types[k],]
		tmp[tmp$relPos==.0600000000000001,]$relPos <- 0.06
		tmp <- data.frame(unique(tmp$relPos),as.vector(tapply(tmp$num,tmp$relPos,sum)))
		names(tmp) <- c("relPos","number")
		tot<- sum(tmp$number)
		new <- tmp$number/tot
		yy <-predict(interpSpline(tmp$relPos, new))
		curline <- ltys[k]
		lines(yy,lty=curline)
		}

		
	plot.new()
	par(mar = c(6, 6, 1, 7),xpd=T);
	plot.window(xlim = c(0,1), ylim=c(0,50000));
	axis(1)
	axis(2)
	mtext(side = 1, text = 'read pos', line=3.5)
	mtext(side = 2, text= 'mismatch count', line=3.5)
	types <- unique(d$type)
	for (k in 1:length(types)) {
		tmp <- d[d$type==types[k],]
		tmp[tmp$relPos==.0600000000000001,]$relPos <- 0.06
		tmp <- data.frame(unique(tmp$relPos),as.vector(tapply(tmp$num,tmp$relPos,sum)))
		names(tmp) <- c("relPos","number")
		
		yy <-predict(interpSpline(tmp$relPos, tmp$number))
		curline <- ltys[k]
		lines(yy,lty=curline)
		}
	a <- c("transversion","transition")
	b <- c("dotted", "dashed")
	legend(x=1.05,y=0.02, legend=a, lty=b,cex=0.8)	
	}
dev.off()
