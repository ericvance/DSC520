# Assignment: Week 8/9 Exercise - Housing Data
# Name: Vance, Eric
# Date: 2022 - 02- 05

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/eric/Documents/GitHub/dsc520")
getwd()

#import housing data
#import the dataset
housing_df <- readxl::read_xlsx("week-6-housing.xlsx")
housing_df

myvars <- c('Sale Price','bedrooms','bath_full_count','bath_half_count','year_built',
            'sq_ft_lot','prop_type')


final_df <- housing_df[myvars]
names(final_df)[names(final_df) == 'Sale Price'] <- 'sale_price'
final_df
#B - i
#I subsetted the data to include only 7 total columns. A lot of the other columns
#had bad or missing data and thus I dropped them. They also seemed unimportant
#to Sale Price. #I also changed the variable name from Sale Price to sale_price

#B - ii
simple_price_lm <- lm(sale_price ~ sq_ft_lot, data = final_df)
multiple_price_lm <- lm(sale_price ~ sq_ft_lot + bedrooms + bath_full_count + year_built,
                        data = final_df)
#in the multiple_price_lm, I included predictors like sq_ft_lot, bedrooms, bathrooms,
#and year built because those are often the key factors that go into pricing a home.
#At least that's what I've learned from years of watching HGTV :-)

#B - iii
summary(simple_price_lm)
summary(multiple_price_lm)
#r2 for simple: 0.01  adjusted: 0.01
#r2 for multiple: 0.14 adjusted: 0.14
#RSquared is a statistical measure of fit for the model.
#These low RSquared values mean that the model is not a great fit.
#The multiple regression was better, but still not ideal.


#B - iv
lm(scale(sale_price) ~ scale(sq_ft_lot) + scale(bedrooms) + scale(bath_full_count)
   + scale(year_built), data = final_df)
#the above are the standardized beta coefficients. This measures the degree of change in the
#outcome variable based on one unit of change in the predictor variable.

#B - v
predict_df <- predict(multiple_price_lm, interval ="confidence")
head(predict_df)
#this is a confidence interval for the expected result. This means that
#we are 95% confident that given the inputs, the sale price will be within these
#two bounds.

#B - vi
anova(simple_price_lm, multiple_price_lm)
#Here the change is notable but not overly significant. Worth nothing how small
#the p-value is.

#B - vii
install.packages('Hmisc')
library('Hmisc')

hist.data.frame(final_df)

#B - viii
final_df.stdres <- rstandard(multiple_price_lm)
final_df.stdres
plot(final_df$sq_ft_lot, final_df.stdres, ylab = "SQ Foot Lot", 
     xlab = "Residual",
     main = "Plot of Residuals")


#B - ix
#Deviance is a function to find the residual sum of squares.
deviance(multiple_price_lm)
#Here, the residual sum of scares is astronomically large. This implies a very poor fit
#between the model and the data.

#B - x
install.packages("car")
library("car")
outlierTest(multiple_price_lm)

#This function identifies the outliers in the input variables to the model.

#B - xi
leverage <- as.data.frame(hatvalues(multiple_price_lm))
leverage
#All of the leverage values are miniscule, and since nothing is >2  we know that they do not
#have high leverage values.

#B - xii
t.test(final_df$sale_price,final_df$bedrooms, paired = TRUE)


