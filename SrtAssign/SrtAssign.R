library(dplyr)
library(igraph)
phase1 <- read.csv("Phase1.csv")
phase1$No. <- NULL
phase1$Time <- NULL
phase1$Protocol <- NULL
phase1$Length <- NULL
phase1 <- filter(phase1, grepl("reply*", Info))
phase1 <- filter(phase1, grepl("202.77.162.213", Destination))
phase1$weight <- (c(4,4,4,3,3,3,3,3,2,2,2,2,1,1,1,1,1,1))
g <- graph.data.frame(phase1, directed=TRUE)
plot(g, edge.width=E(g)$weight)



Phase2 <- read.csv("Phase2.csv")
Phase1$No. <- NULL
Phase2$No. <- NULL
Phase2$Protocol <- NULL
Phase2$Length\ <- NULL
Phase2$Length <- NULL
sadmind <- filter(Phase2, grepl("Port:3*", Info))
failed <- filter(Phase2, grepl("GETPORT Call *", Info))
failed <- unique(Phase2$Destination)

if (grepl("Port:3*", Phase2$Info) == TRUE) {
  Phase2$success <-'yes' } 
else {
  Phase2$success <- 'no' }


