install.packages("gmodels")
library("gmodels")
StarWarsSurvey <- read.csv("SW_survey_renamed.csv")
head(StarWarsSurvey)
#there are two assumptions with ind chi squares - must have ind.data and expec.fre >5.


#use CrossTable() function from gmodels, specify IV then DV. use argument fisher=TRUE

#to specify you want Fisher's Exact Test to calculate effect size, and chisq=TRUE is to get 

#the results from the chi square. next arg is one of two required: expected =TRUE will

#provide expected freqs, and include format="SPSS" to get them printed out.

#last argument is sresid=TRUE provides standardized residuals. used later for determining effect sizes.


CrossTable(StarWarsSurvey$Age, StarWarsSurvey$RankI, fisher=TRUE, chisq = TRUE, expected = TRUE, sresid=TRUE, format="SPSS")
