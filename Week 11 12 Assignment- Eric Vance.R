# Assignment: Week 11/12 Part 1
# Name: Vance, Eric
# Date: 2022-02-25

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/eric/Documents/GitHub/dsc520/data")
getwd()

#load the data
df1 <- read.csv("binary-classifier-data.csv")
df1

df2 <- read.csv("trinary-classifier-data.csv")
df2

#scatter plots
plot1 <- plot(df1$x, df1$y)
plot2 <- plot(df2$x, df2$y)

#looking at the data right now, it appears that both are clustered

library(class)
kNearest <- knn(df1, df2, df1$y, k=3)
kNearest <- knn(df1, df2, df1$y, k=5)
kNearest <- knn(df1, df2, df1$y, k=10)
kNearest <- knn(df1, df2, df1$y, k=15)
kNearest <- knn(df1, df2, df1$y, k=5)

#I do not think a linear classifier would work on this model. 
