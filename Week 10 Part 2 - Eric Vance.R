# Assignment: Week 10 Part 2
# Name: Vance, Eric
# Date: 2022-02-16

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/eric/Documents/GitHub/dsc520/data")
getwd()

#bring in data
df <- read.csv("binary-classifier-data.csv")
df

#create the logistic model
log_model <- glm(label ~ x + y, data = df, family = binomial(link = "logit"))
summary(log_model)

#plot differences between predicted and actual
plot(x=predict(log_model), y = df$label,
     xlab = "Predicted",
     ylab = "Actual")

#again, this doesn't seem to be as accurate as it could be. will keep this in mind for future
#assignment with this data