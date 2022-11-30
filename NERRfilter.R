install.packages("dplyr")
install.packages("naniar")

library(ggplot2)
library(dplyr)
library(naniar)
require(ggplot2)

rm(list=ls(all=TRUE))
set.seed(1234)


sals <- read.csv("LoosinCreek.csv", fill = FALSE, header = TRUE) 

sals = select(sals, 1,3,5)
sals[sals == " "] <- "NA"
is.na(sals[[3]]) <- sals[[3]] > 50 
is.na(sals[[3]]) <- sals[[3]] < 5 

research.creek <- subset(sals, StationCode=="nocrcwq   ")
loosin.creek <- subset(sals, StationCode=="noclcwq   ")
zekes.basin <- subset(sals, StationCode=="noczbwq   ")
east.cribbings <- subset(sals, StationCode=="nocecwq   ")

write.csv(research.creek,"ResearchCreek.csv", row.names = FALSE)
write.csv(loosin.creek,"LoosinCreek.csv", row.names = FALSE)
write.csv(zekes.basin,"ZekesBasin.csv", row.names = FALSE)
write.csv(east.cribbings,"EastCribbings.csv", row.names = FALSE)

ggplot(data = nocrcwq, aes(x = DateTimeStamp, y = Sal)) +
  geom_point() +
  labs(x = "Date",
       y = "Salinity",
       title = "Salinity")
