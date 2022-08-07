rr=data.frame(rivers)
View(rivers)
head(rr)



length <- c(735, 320, 325, 392, 524, 450)
length_df <- data.frame(length)
L <- ggplot(length_df, aes(x=length))
L + geom_histogram(binwidth = 50) +
  ggtitle("Length of Rivers in US") +
  xlab("Length (in miles)") +
  ylab(" ")



L <- ggplot(rivers, aes(x="", y= length))
L + geom_boxplot() +
  xlab("")

length <- c(735, 320, 325, 392, 524, 450)
length <- data.frame(length)
ggplot(rr, aes(sample=rivers)) +
  geom_qq(aes(color="black")) +
  ggtitle("Length of Rivers") +
  xlab("Length (in miles)") 


length <- c(735, 320, 325, 392, 524, 450)
length_df <= data.frame(length)
ggplot(length_df, aes(sample=length_df)) +
  geom_qq()


rr = data.frame(rivers)
head(rr)