# Assignment: Thoracic Surgery Data - Week 10
# Name: Vance, Eric
# Date: 2022-02-15

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/eric/Documents/GitHub/dsc520/data")
getwd()

#install foreign to read .arff file
install.packages("sos")
library("sos")
findFn("arff")

#pull in the data
df <- read.arff("ThoraricSurgery.arff")
df

#create the model
log_model <- glm(Risk1Yr ~ AGE + PRE4 + PRE5 + PRE6 + PRE7 + PRE8 + PRE9 + PRE14 +
                   PRE25 + PRE30 + PRE32, data = df, family = binomial(link = "logit"))

#summary of the model
summary(log_model)
#here it looks like age had the biggest affect on survival rate based on the coefficients

plot(x=predict(log_model), y = df$Risk1Yr,
     xlab = "Predicted",
     ylab = "Actual")


#the accuracy of the model is not great - there is definitely some room for improvement based on 
#the difference between the predicted data and the actual data