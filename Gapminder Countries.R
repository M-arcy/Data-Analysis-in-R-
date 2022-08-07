library(dplyr)
library(ggplot2)
library(gapminder)

levels(gapminder$country)

gm_my5countries <- filter(gapminder, country %in% c("Afghanistan", "Egypt", "Israel", "Iran", "Jordan"))
gm_my5Clean <- select(gm_my5countries, country, year, lifeExp, gdpPercap)
head(gm_my5Clean)
tail(gm_my5Clean)

lifeexpec <- ggplot(gm_my5Clean) +
  geom_line(aes(x= year, y = lifeExp, color = country)) +
  ylab("Life Expectancy") + ggtitle("Life Expectancy in my 5 chosen countries")

GDP <- ggplot(gm_my5Clean) + geom_line(aes(x= year, y= gdpPercap, color= country)) +
  ylab("Per Capita GDP") +
  ggtitle("GDP in Five Countries")
grid.arrange(lifeexpec, GDP, ncol=1)
library("gridExtra")

ggplot(gm_my5Clean, aes(x= year, y= lifeExp, color= country, log10())) +
  geom_line() +
  geom_point(aes(size= gdpPercap)) +
  ylab ("GDP per capita") + ggtitle("GDP in Five Countries")

life <- gapminder %>% group_by(year) %>% summarise(life.med= median(lifeExp))
print(life)

lifeexpec <- ggplot(gm_my5Clean) +
  geom_line(aes(x= year, y = lifeExp, color = country)) +
  ylab("Life Expectancy") + ggtitle("Life Expectancy in my 5 chosen countries")
AllLifeMedian <- ggplot(life) + geom_line(aes(x=year, y= lifeExp, color= country))
grid.arrange(lifeexpec, AllLifeMedian, ncol=1)

life <- ggplot(life, aes(x= year, y = life.med, color = year)) +
  geom_line() +
  geom_point() +
  ylab ("Life Expectancy") + ggtitle("Comparison of Life Expectancy")
lifeexpec <- ggplot(gm_my5Clean) +
  geom_line(aes(x= year, y = lifeExp, color = country)) +
  ylab("Life Expectancy") + ggtitle("Life Expectancy in my 5 chosen countries")
grid.arrange(life, lifeexpec, ncol=1)


