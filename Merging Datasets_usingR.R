#Lesson2 HandsOn graded
#doing the exercise in R because I need the practice.
library(tidyr)
testusers <- read.csv('airbnb_test_users.csv')
head (testusers)
country <- read.csv('airbnb_sample_submission.csv')
additionalusers = read.csv('airbnb_users.csv')
#What is average age of users in each browser type?
testusers_average_age <- aggregate(age ~ first_browser, testusers, mean)
#What is the total signup flow for each device?
total_signup <- aggregate(signup_flow ~ first_device_type, testusers, sum)

#add country column into test_users file
country_all <- merge(testusers, country, by= c('id'), all=TRUE)
head(country_all)
#add additional users in test_users file
users_all <- merge(country_all, additionalusers, by=c('id'), all=TRUE)
#or I could use rbind() but I would have to rename some columns. just merged 
#the two datasets instead. 

