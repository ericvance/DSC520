# Assignment: Week 4 - Part 2
# Name: Vance, Eric
# Date: 2022-01-05

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/eric/Downloads")

## Check CWD
getwd()

#import the dataset
housing_df <- readxl::read_xlsx("week-6-housing.xlsx")
housing_df


#2 - a
#using apply function to find the median sale date
apply(housing_df[c('Sale Date')], 2, median)

#2 - b
#using aggregate function on variable
#subsetting the data first to make it easier to work with
#then aggregating by year renovated, mean sale price
myvars <- c('Sale Price','year_renovated')
subset_housing_df <- housing_df[myvars]
subset_housing_df
aggregate(subset_housing_df,by=list(subset_housing_df$year_renovated),mean)


#2 - c
#using plyr on a variable in the dataset
#rounding Sale Price to nearest dollar
#performed modification on Sale Price column and then brought it back to original DF
housing_df$SalePriceRound <- with(housing_df, round(housing_df$`Sale Price`))
housing_df$SalePriceRound
housing_df


#2 - d
#checking data distribution. for this I'll check distro of Year Renovated
#because it's a clean number and discrete

## Load the ggplot2 package
install.packages("ggplot2")
library(ggplot2)

ggplot(housing_df, aes(SalePriceRound)) + geom_histogram(binwidth=5000)
#2 - e
#As you can see from the data distribution, there are some outliers, but nothing
#too crazy. A ~5 million dollar home, while rare, is nowhere near impossible and should
#not be discounted. 

#2 - f
#I've already created one new variable, SalePriceRound
#The second variable I'll be creating is price per square foot of lot
housing_df$PricePerSqFoot <- with(housing_df, sq_ft_lot/`Sale Price`)
housing_df$PricePerSqFoot
housing_df
