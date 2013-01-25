#multiplot code from : http://wiki.stdout.org/rcookbook/Graphs/Multiple%20graphs%20on%20one%20page%20(ggplot2)/
multiplot <- function(..., plotlist=NULL, cols) {
    require(grid)

    # Make a list from the ... arguments and plotlist
    plots <- c(list(...), plotlist)

    numPlots = length(plots)

    # Make the panel
    plotCols = cols                          # Number of columns of plots
    plotRows = ceiling(numPlots/plotCols) # Number of rows needed, calculated from # of cols

    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(plotRows, plotCols)))
    vplayout <- function(x, y)
        viewport(layout.pos.row = x, layout.pos.col = y)

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
        curRow = ceiling(i/plotCols)
        curCol = (i-1) %% plotCols + 1
        print(plots[[i]], vp = vplayout(curRow, curCol ))
    }

}

a <- read.csv("/Users/singhal/Desktop/ontology/cellularComponent_multilevel.txt")
b <- read.csv("/Users/singhal/Desktop/ontology/biologicalProcess_multilevel.txt")
c <- read.csv("/Users/singhal/Desktop/ontology/molecularFunction_multilevel.txt")
data <- list(a,b,c)
graphs <- list()
terms <- list()
names(data) <- c("cellular component","biological process","molecular function")
for (i in 1:length(data)) {
	data[[i]] <- data[[i]][order(data[[i]]$Score),]
	terms[[i]] = data[[i]]$GO.term
	terms[[i]] = factor(terms[[i]],levels=terms[[i]])
	g <- qplot(data[[i]]$Score,terms[[i]],data=data[[i]]) + ylab(names(data)[i])+xlab("number of sequences")
	graphs[[i]] <- g
	}