phase1 <- read.csv("Phase1.csv")
phase1$No. <- NULL
phase1$Time <- NULL
phase1$Protocol <- NULL
phase1$Length <- NULL
phase1 <- filter(phase1, grepl("reply*", Info))
phase1 <- filter(phase1, grepl("202.77.162.213", Destination))
phase1$weight <- (c(1,1,1,2,2,2,2,2,3,3,3,3,4,4,4,4,4,4))
plot(g,layout=layout.fruchterman.reingold(g,weights=E(g)$weight^3))
g <- graph.data.frame(phase1, directed=TRUE)
