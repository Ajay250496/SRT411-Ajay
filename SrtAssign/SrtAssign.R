library(dplyr)
library(igraph)
phase1 <- read.csv("Phase1.csv")
phase1$No. <- NULL
phase1$Time <- NULL
phase1$Protocol <- NULL
phase1$Length <- NULL
#libraryphase1 <- filter(phase1, grepl("reply*", Info))
phase1 <- filter(phase1, grepl("202.77.162.213", Destination))
phase1$weight <- (c(4,4,4,3,3,3,3,3,2,2,2,2,1,1,1,1,1,1))
phase1 <- unique(Phase1$Source)
g <- graph.data.frame(phase1, directed=TRUE)
plot(g)


library(dplyr)
Phase2 <- read.csv("Phase2.csv")
Phase2$No. <- NULL
Phase2$Time <- NULL
Phase2$Protocol <- NULL
Phase2$Length <- NULL
sadmind <- filter(Phase2, grepl("Port:[0-9]*", Info)) #filter out all vulnerable hosts
failed <- filter(Phase2, grepl("GETPORT Call*", Info)) #filter out all non-vulnerable hosts
failed <- as.data.frame(unique(failed$Destination))
#failed <- unique(Phase2$Destination)
slices <- c(nrow(sadmind), nrow(failed))
pct <- round(slices/sum(slices)*100) #calc percentage
lbls <- c("Hosts with sadmind vulnerability", "Hosts without sadmind vulnerability")
lbls <- paste(lbls, pct)
lbls <- paste(lbls,"%",sep="")
opar <- par(no.readonly = TRUE)#Border width
par(lwd = 3) #border witdht
pie(slices, labels=lbls, col=c("red","blue" ), main="Sadmind Vulnerability Percentage")

