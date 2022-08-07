data("USArrests")
View("USArrests")

#Load in libraries

library(ggplot2)

regressionModel <- lm(Assault ~ UrbanPop, USArrests)
summary(regressionModel)

graphAssaults <- ggplot(USArrests, aes(x= UrbanPop, y= Assault)) +
  geom_point() +
  geom_smooth(method = lm, se=FALSE)
graphAssaults

library(faithful)
faithful
d <- ggplot(faithful, aes(x=eruptions, y=waiting))
d + geom_point() + ggtitle("Old Faithful Eruption vs wait times") +
  geom_smooth(method = lm, color = "goldenrod2")

#smooth is best fit line, gray shading is the confidence region or margin of error
#gray is turned off with se=FALSE
#color gets added in the geomsmooth because it's part of the line!
