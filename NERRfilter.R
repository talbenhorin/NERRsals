library(ggplot2)
library(dplyr)
library(naniar)
require(ggplot2)
library(signal)

rm(list=ls(all=TRUE))
set.seed(1234)

sals <- read.csv("LoosinCreek.csv", fill = FALSE, header = TRUE) 
sals = select(sals, 2,3)


ggplot(data = sals, aes(x = DateTimeStamp, y = Sal)) +
  geom_point() 