d <- read.table("/Users/singhal/Desktop/SS34_1_final.qual.out",header=T)
p <-ggplot(d,aes(factor(column),med))
p+geom_boxplot(aes(lower=d$Q1,upper=d$Q3,ymin=d$min,ymax=d$max,middle=d$med,width=0.4),stat="identity")+xlab("position on read")+ylab("quality score")+opts(axis.ticks = theme_blank(), axis.text.x = theme_blank())