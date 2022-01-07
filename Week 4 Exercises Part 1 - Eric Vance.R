# Assignment: Week 4 - Part 1
# Name: Vance, Eric
# Date: 2022-01-05


## Set the working directory to the root of your DSC 520 directory
setwd("/Users/eric/Downloads")

## Check CWD
getwd()

##import the scores.csv file
scores_df <- read.csv("scores.csv")

scores_df

#1. The observational units in this data frame are Score, Section, and the 
#count of students who got each score.

#2. There are three variables that we're working with here.Here are their types:
#Count - Numerical
#Score - Numerical
#Section - Categorical

#3
#create subset consisting only of Sports 
sports_df <- subset(scores_df, Section == 'Sports')
sports_df

#create subset consisting only of Regular
regular_df <- subset(scores_df, Section == 'Regular')
regular_df


x1 <- sports_df$Score
y1 <- sports_df$Count
plot(x1,y1,'type'='b','main'='Sports Scores',xlab='Score',ylab='Count')

x2 <- regular_df$Score
y2 <- regular_df$Count
plot(x2,y2,'type'='b','main'='Regular Scores',xlab='Score',ylab='Count')

#4.1 - The regular section seemed to score more points. Their data was skewed
#more towards the right, indicating higher scores. The sports section had a
#big peak in the middle, while the regular section peaked higher and was consistently
#higher as well.

#4.2 - No, not every student in one section outscored every student from the other.
#In this context, the statistical tendency is more like the center of the distribution
#In this case, the regular section had a higher tendency, as the center of their distribution
#was farther to the right than the sports section.

#4.3 - A variable that could explain the difference in distributions is average time spent
# per student per section. Often, the more time spent on a course, the better the student
#does. This could be useful in explaining the disparity between the sections.
