# Assignment: Week 5 Exercises
# Name: Vance, Eric
# Date: 2022-01-11

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/eric/Downloads")

## Check CWD
getwd()

#import the dataset
housing_df <- readxl::read_xlsx("week-6-housing.xlsx")
housing_df

#install dplyr package
install.packages("dplyr")
library("dplyr")

#a - groupby
group_housing <- housing_df %>% group_by('ctyname')
group_housing

#a - summarize
new_house_df <- as_tibble(housing_df)
new_house_df
new_house_df %>% summarise(median(sale_reason))

#a - mutate
housing_df %>% select(bath_full_count, bedrooms) %>% mutate(bath_full_count + bedrooms)

#a - filter
housing_df %>% filter(bath_full_count == 5)

#a - select
housing_df %>% select('Sale Price', bath_full_count)

#a - arrange
housing_df %>% select('Sale Price', bath_full_count, bedrooms) %>% group_by(bath_full_count) %>% arrange(desc(bedrooms))

#b - purrr functions

library("purrr")
#keep function
keep(housing_df$year_built, function(x) x>1990)
#discard function
discard(housing_df$year_built, function(x) x < 2010)







#c - cbind and rbind

#cbind
myvars1 <- c('Sale Price','year_renovated')
myvar2 <- c('bedrooms')
subset_housing_df1 <- housing_df[myvars1]
subset_housing_df2 <- housing_df[myvar2]
bound_df <- cbind(subset_housing_df1, subset_housing_df2)
bound_df

#rbind
sub1 <- housing_df[1:4, ]
sub2 <- housing_df[5:8, ]
sub1
sub2
rbound_df <- rbind(sub1, sub2)
rbound_df

#d - string split
#split
install.packages('tidyr')
library(tidyr)
housing_df %>% separate(addr_full, c('part1','part2')) -> df2 
head(df2, 3)

#put back together
df2 %>% unite('full address', part1, part2, sep=' ') -> df3
head(df3$`full address`,3)





