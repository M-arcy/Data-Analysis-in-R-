library("mvnormtest")
library("car")
library("IDPmisc")
library("dplyr")
library("rcompanion")
library("readr")

heartattacks <- read_csv("Downloads/heartAttacks.csv")
View(heartattacks)
tail(heartattacks)

str(heartattacks$trestbps)
str(heartattacks$chol)

heartattacks$trestbps <- as.numeric(heartattacks$trestbps)
heartattacks$chol <- as.numeric(heartattacks$chol)
heartattacks$sex <- as.numeric(heartattacks$sex)

heartattacks$sex <- as.factor(heartattacks$sex)
heartattacks$sex <- as.character(heartattacks$sex)

keep <- c("sex","trestbps", "chol")
heartattacks <- heartattacks[keep]


install.packages("plyr")
library("plyr")

# assumption sample size
count(heartattacks, "sex")
# assumption NOT violated - more cases per number 
# of dependent variables for male and female


# feature selection for shapiro test
keeps1 <- c("trestbps", "chol")
heartattacks1 <- heartattacks[keeps1]

mshapiro.test(t(heartattacks1))


leveneTest(trestbps ~ sex, data=heartattacks)
leveneTest(chol ~ sex, data=heartattacks)

cor.test(heartattacks$trestbps, heartattacks$chol, method = "pearson", use="complete.obs")

MANOVA <- manova(cbind(trestbps, chol) ~ sex, data=heartattacks)
summary(MANOVA)

summary.aov(MANOVA, test = "wilks")

gendermeans <- heartattacks %>% group_by(chol) %>% summarize(Mean = mean(sex))
gendermeans


