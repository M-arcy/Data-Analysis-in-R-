#Final Project DSO102C

#Import necessary components

install.packages("Ecdat")

library(Ecdat)
library(ggplot2)
library(PerformanceAnalytics)
library(reshape)
library(dplyr)
library(DAAG)
library(gridExtra)


#Data
head(Cigarette)
Cigarette

#Box Plot for Average Number of packs per capita, graphed on slide #4

CPack<- ggplot(Cigarette, aes(x = state, y= packpc, color= state)) + geom_boxplot()
CPack

#Which states (2) has the highest sales per person?
Pack<-Cigarette %>% group_by(state) %>% summarise(Mean = mean(packpc)) %>% arrange(desc(Mean))
Pack

#Which states(2) has the lowest sales per person?
Cigarette %>% group_by(state) %>% summarise(Mean = mean(packpc)) %>% arrange(Mean)

head(Pack)
tail(Pack)
#I completed this two ways. One by using "summarise" and "arrange" and the other by using the head ant tail of the inital set up.
print("Kentucky and New Hampshire have the highest number of packs, while Arizona and Idaho have the lowest.")


#Average Number of packs per capita, graphed on slide #4
CPPOPA<- Cigarette %>% group_by(year) %>% summarise(Median=median(packpc))
CPPOPA

#Median Plot for 1985- 1995
CPPOPM<- Cigarette %>% group_by(year) %>% summarise(Median=median(packpc))
CPPOPM

ggplot(CPPOPM, aes(x= year, y = Median)) + geom_point()

#Scatter plot of price per pack vs number of packs per capita for all states and years

ggplot(Cigarette, aes(x= packpc, y= avgprs))+geom_point() + geom_smooth(method=lm, se= FALSE)+ ggtitle("Price Per Pack vs number of Packs Per Person a Year")+ xlab("Pack Per Person a Year") + ylab("Average Price Per Packa Year")

#Negatively correlated, looks like the price of cigarettes went up probably due to inflation. The number of packs per per decreased probably due to price and social initiatives to stop smoking which also could drive up prices

#Color by year

ggplot(Cigarette, aes(x= packpc, y= avgprs, color=year))+geom_point() + geom_smooth(method=lm, se= FALSE)+ ggtitle("Price Per Pack vs number of Packs Per Person a Year")+ xlab("Pack Per Person a Year") + ylab("Average Price Per Packa Year")

#Correlation Test

cor.test(Cigarette$packpc, Cigarette$avgprs, method = "pearson", use="complete.obs")
#p-value is .00000000000000002
# r value -0.5854443
#Significantly Correlated



#Price per pack vs average price per pack
ggplot(Cigarette, aes(x= packpc, y= avgprs, color=year))+geom_point() + geom_smooth(method=lm, se= FALSE)+ ggtitle("Price Per Pack vs number of Packs Per Person a Year")+ xlab("Pack Per Person a Year") + ylab("Average Price Per Packa Year")



#Linear Regression
Regression<- lm(packpc~avgprs, Cigarette)
summary(Regression)
Regression

#There is a 2.4% variation



#The plot above does not adjust for inflation. You can adjust the price of a pack of cigarettes for inflation by dividing the avgprs variable by the cpi variable. Create an adjusted price for each row, then re-do your scatter plot and linear regression using this adjusted price.
inflation<- Cigarette %>% mutate(yrinflt = avgprs / cpi)

View(inflation)

#Scatter Plot of inflation pricing, now we see a negative regression, As inflation increased the pack per person decreased.
ggplot(inflation, aes(x= yrinflt, y= packpc, color=year))+geom_point() + geom_smooth(method=lm, se= FALSE)+ ggtitle("Price Per Pack vs number of Packs Per Person a Year")+ xlab("After Inflation Pack Per Person Per Year") + ylab("Average Price Per Pack a Year")


#Data frame with information from 1985 only
C1985<-Cigarette %>% filter(year == 1985)
View(C1985)


#Data frame with information from 1995 only
C1995<-Cigarette %>% filter(year == 1995)
View(C1995)

#Vectors with price per year
pCap85<- c(C1985$packpc)
pCap95<-c(C1995$packpc)

pCap95
pCap85


#Dependent t-Test on packs from 1985 and 1995
#Hypothesis
#Null hypothesis = Both years have the same amount of packs per person
#Alternative hypothesis = 1995 has a different amount of pack per person bought than 1985
t.test(pCap85,pCap95, paired = TRUE)
#p-value is 2.2e-16 (less than 5%)
#There is a big difference in the mean between 1985 and 1995
#I reject the null hypothesis and fail to reject the alternative hypothesis


#BONUS!

#What are the cost of cigarettes in each state in 1995
ggplot(C1995, aes(x=state, y = avgprs, color= state)) + geom_point() + xlab("Packs Per Person") + ylab("Average Price Per Pack") + ggtitle("Average Price Per Pack & Price Per Person in 1995")

#What are the cost of cigarettes in each state in 1990
C1990<-Cigarette %>% filter(year == 1990)
View(C1990)
ggplot(C1990, aes(x=state, y = avgprs, color= state)) + geom_point() + xlab("Packs Per Person") + ylab("Average Price Per Pack") + ggtitle("Average Price Per Pack & Price Per Person in 1990")
#Does look like much change
pCap90<-c(C1990$packpc)
pCap90
t.test(pCap95,pCap90, paired = TRUE)
#Yep, there's a difference between 1995 & 1990
#1985 &1995?
t.test(pCap85,pCap90, paired = TRUE)
#Indeed


