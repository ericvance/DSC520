# Assignment: Ex 3.1
# Name: Vance, Eric
# Date: 2021-12-13

## Load the ggplot2 package
install.packages("ggplot2")
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/eric/Documents/Github/dsc520/assignments/")

#reading in the CSV file
hs_df <- read.csv("acs-14-1yr-s0201.csv")
#getting the column names (a.i.)
colnames(hs_df)

#Please provide the output from the following functions: str(); nrow(); ncol()
str(hs_df)
nrow(hs_df)
ncol(hs_df)

#Create a Histogram of the HSDegree variable using the ggplot2 package.
ggplot(hs_df, aes(HSDegree)) + geom_histogram(bins=10) + ggtitle("HS Degree Count")


#Based on what you see in this histogram, is the data distribution unimodal?
 ##Yes - it is unimodal. It seems to only have one peak.

#Is it approximately symmetrical?
 ##No, it does not appear to be symmetrical, rather it looks skewed to the right.

#Is it approximately bell-shaped?
 ##It is loosely bell shaped, though more extreme. Steep drop offs on either side of the peak.

#Is it approximately normal?
 ##No, I don't believe it's a standard normal distribution. It is too skewed.

#If not normal, is the distribution skewed? If so, in which direction?
 ##There is a positive skew to the data distribution in this plot.

#Include a normal curve to the Histogram that you plotted.


new_df <- ggplot(hs_df, aes(HSDegree)) + 
  geom_histogram(aes(y=..density..),bins=10) + ggtitle("HS Degree Count")+
  stat_function(fun = dnorm, args = list(mean = mean(hs_df$HSDegree, na.rm = TRUE),
                                         sd = sd(hs_df$HSDegree, na.rm = TRUE)),
                colour = "black", 
                size = 1)
new_df
#Explain whether a normal distribution can accurately be used as a model for this data.
 ##A standard normal distribution can not be used - as the data we have is too positively skewed.


#Create a Probability Plot of the HSDegree variable.
 ##I'm assuming this means a density distribution:
df_density = ggplot(hs_df, aes(HSDegree)) + geom_density()
df_density

#Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
 ##I would say no. It is positively skewed, and there is quite a long tail on the left. It resembles the shape but not enough to be a standard normal dist.

#If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
 ##It is skewed positively. I know this because of the long tail on the left and the steep drop-off on the right.


#Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. 
#Include a screen capture of the results produced.
install.packages("pastecs")
library(pastecs)
stat.desc(hs_df[7], norm = TRUE)

#In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. 
#In addition, explain how a change in the sample size may change your explanation?

#Skewness:Because the data is < -1, the data can be considered highly skewed.
#Kurtosis:Normal dist kurtosis is 3, so this has a thinner bell than the normal distribution.
#Z-score:In this case, a positive z-score would be > mean, while a negative would be < mean.

#In general, a larger sample size means more accurate data. The smaller sample means that
#there will be larger variance and less reliable data. Population statistics, in general, seem
#to follow the normal distribution quite often.


