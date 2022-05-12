#install.packages("gmodels")

library('gmodels')
library('dplyr')


loans$DateR <- as.Date(paste(loans$Date), "%m/%d/%Y")



loans$DateR <- as.Date(paste(loans$Date), "%m/%d/%Y")

loans1 <- separate(loans, DateR, c("Year", "Month", "Day"), sep="-")

loans1$YearR <- NA
loans1$YearR[loans1$Year <= 2009] <- 0
loans1$YearR[loans1$Year > 2009] <- 1

loans1$RentvOwn <- NA
loans1$RentvOwn[loans1$home_ownership == "RENT"] <- 0
loans1$RentvOwn[loans1$home_ownership == "OWN"] <- 1


CrossTable(loans$term, loans$loan_status, chisq=TRUE, expected=TRUE, sresid=TRUE, format="SPSS")
CrossTable(loans1$RentvOwn, loans1$YearR, fisher=TRUE, chisq = TRUE, mcnemar = TRUE, expected = TRUE, sresid=TRUE, format="SPSS")

