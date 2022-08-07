ZikaUS <- read_excel("ZikaUS.xlsx")
zikaColumbia <- read_excel("ZikaColombia.xlsx")
head(zikaColumbia)
head(ZikaUS)
tail(zika)
#append to just add rows
zika <- rbind(ZikaUS, zikaColumbia)
zika
tail(zika)
