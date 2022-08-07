#DSO103 L5 hands on solution

## Install and Load Libraries

library("corpcor")
library("GPArotation")
library("psych")
library("IDPmisc")

## Data Wrangling

### Subsetting data

studentSurveyArea <- studentSurvey[, 31:42]

### Remove missing data

studentSurveyArea2 <- NaRV.omit(studentSurveyArea)

## Testing Assumptions

### Sample size - must have 300 as a general rule of thumb, though if things are pretty well related you can get away with 150 or so.

#### 

### Absence of Multicollinearity

#### Do a correlation matrix!

studentSurveyAreaMatrix <- cor(studentSurveyArea2)
View(round(studentSurveyAreaMatrix, 2))


##### Don't want any items correlated above a .9, and don't want a variable with more than a few correlations below a .3, first glance this appears ok

#### Do Bartlett's test

cortest.bartlett(studentSurveyArea2)

##### This tests against an identity matrix, where there are no correlations at all, so we want this test to be significant, which means that there are relationships between the variables

#### Determinant of the Correlation Matrix

det(studentSurveyAreaMatrix)

##### This number should be greater than .00001. 

pcModel <- principal(studentSurveyArea2, nfactors = 12, rotate = "none")
pcModel

# Look at SS loadings for eigenvalues to determine how many factors. Looking for how many over 1 there are. Looks like only 1

## Can also look at scree plot

plot(pcModel$values, type="b")

## Again, looks like only one factor