install.packages("Ecdat")
library(Ecdat)
head(Cigarette)
library(dplyr)
library(ggplot2)
#boxplot of avg # packs by state
ggplot(Cigarette, aes(x= packpc, y = state)) +
  geom_boxplot() +
  xlab("Average number of packs") +
  ylab("State") +
  ggtitle("Average Number of Cigarette Packs by State")
Cigarette %>% group_by(year) %>% summarise(Median = median(packpc)) %>% arrange(desc(Median))

#plot median value for each state for years 1985-1995
MedianDF <- Cigarette %>% group_by(year) %>% summarise(Median = median(packpc))


#plot years
unique(Cigarette$year)
ggplot(MedianDF, aes(x= year, y= Median)) +
  geom_point()
#scatterplot of price per pack vs #packsper capita for all states and year
ggplot(Cigarette, aes(x= avgprs, y = packpc)) +
  geom_point() + geom_smooth(method=lm)
#negatively correlated - as price goes up, number of packs smoked goes down, inverse relationship
cor.test(Cigarette$avgprs, Cigarette$packpc, method = "pearson", use="complete.obs")
#p value = 2.2e-16 and is significantly correlated, but 

#change year points to color
ggplot(Cigarette, aes(x= avgprs, y = packpc, color= year)) +
  geom_point() + geom_smooth(method=lm)
#later years lower packpc
#linear regression
Regression <- lm(packpc~avgprs, Cigarette)
summary(Regression)
#-.40879 based on one unit 
#.001 - pretty sure
#adjusted R 25:51 in video
#how much variability does line explain? 30% of variability
#plot adjusted for inflation 

#convert packpc and adjust for inflation
InflatedCigs <- Cigarette %>% mutate(AdjPrice = avgprs/cpi )


ggplot(InflatedCigs, aes(x= AdjPrice, y = packpc, color= year)) +
  geom_point() + geom_smooth(method = lm)

Regression <- lm(packpc~AdjPrice, Cigarette)
summary(Regression)

#create dataframe for 1985; then just 1995. run dep t-test for #packpc
year1985 <- filter(Cigarette, year == "1985")

year1995 <- filter(Cigarette, year == "1995")
year1995
Avg1985 <- mean(year1985$packpc)
Avg1985
Avg1995 <- mean(year1995$packpc)
Avg1995
PackT <- t.test(year1985$packpc, year1995$packpc, paired = TRUE)
PackT

#doublecheckin my math
Cigarette %>% group_by(packpc) %>% group_by(year) %>% summarise(mean.packpc = mean(packpc))
View(Cigarette)

PerCapIncome <- Cigarette %>% mutate(PCincome = income/pop )
View (PerCapIncome)
ggplot(PerCapIncome, aes(x= PCincome, y = packpc)) +
  geom_point() +
  geom_smooth(method = lm)

I <- (PerCapIncome$PCincome)
C <- (PerCapIncome$packpc)
ggplot(PerCapIncome, aes(x= I, y = C, color = income)) +xlab("Per Capita Income") +
  ylab("Packs PerCapita") +
  ggtitle("Does Income Affect Smoking")+
  geom_point() +
  geom_smooth(method = lm)

ggplot(PerCapIncome, aes(x= packpc, y = PCincome)) +
  geom_boxplot() +
  xlab("Average number of packs") +
  ylab("PerCapita Income") +
  ggtitle("Does Income Affect Smoking?")
